
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smarthome/core/helper/show_snackBar.dart';
import 'package:smarthome/features/auth/Login/controller/login_cubit.dart';

import 'package:smarthome/features/auth/Login/model/user_model.dart';


import '../../../../../constants.dart';

part 'edit_state.dart';

class EditCubit extends Cubit<EditState> {
  EditCubit() : super(EditInitial());

  bool upIsLoading = false;
  bool  isDataLoading = false;
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> userUpdate(context,{

    required bool emailVerified,
    required String name,
    required String phone,
    required String id,
  }) async {
    emit(UpdateLoadingState());
    upIsLoading = true;
    try {

      await usersCollection.doc(id).update({

        'displayName': name,

        'phoneNumber': phone,
        'emailVerified': emailVerified,
        'photoUrl': phUrl,

      }).then((value) async{
        await getData(context);
        upIsLoading = false;
        showSnackBar(context, "Edit Profile Done");
        emit(UpdateSuccessState());
      });
    } catch (e) {
      upIsLoading = false;
      emit(UpdateSuccessState());
      if (kDebugMode) {
        print(e);
      }
    }
  }




  Future<void> getData(context) async {
    emit(DataLoadingState());
    isDataLoading = true;

    String? uid = FirebaseAuth.instance.currentUser?.uid;
    try {
      usersCollection.snapshots().listen((event) {
        for (int i = 0; i < event.docs.length; i++) {
          Map map = event.docs[i].data() as Map;


          if (map['id'] == uid) {
            BlocProvider.of<LoginCubit>(context).getData(context);
            emit(DataSuccessState(model:UsersModel.fromJson(event.docs[i] )));

          }
        }


        // value.docs.forEach((element) {
        //
        //   Map? map = element.data() as Map;
        //   //print( map['id']);
        //   if(map['id'] == uid ){
        //     model.add( UsersModel.fromJson(element.data()));
        //
        //   }

        isDataLoading = false;

      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isDataLoading = false;
      emit(DataFailureState());
    }
  }

  //File? _imageFile;
  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<void> pik()async{
  try{
    final File? image = await _pickImage();

   // _imageFile = image;
emit(PostImagePickedSuccess());
  }catch(e){
    print("""
    
    
    ${e.toString()}
    """);

  }
  }
  // Future<void> _uploadImage(File imageFile) async {
  //   final Reference storageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
  //   final UploadTask uploadTask = storageRef.putFile(imageFile);
  //   final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));
  //   final String url = await downloadUrl.ref.getDownloadURL();
  //   print('File uploaded: $url');
  // }
}
