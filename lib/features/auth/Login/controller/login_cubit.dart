import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import 'package:smarthome/core/helper/navegate_to.dart';


import '../../../../constants.dart';
import '../../../../core/helper/show_snackBar.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';

import '../model/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool isPassword = true;
  bool isLoading = false;

  String password = '';
  bool isDataLoading = false;
  bool isLoadingForGoogle = false;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  void changepassword() {
    isPassword = !isPassword;
    emit(PasswordState());
  }

  /// -***************** signInWithEmailAndPassword ************************************************
  Future loginUser(
    BuildContext context, {
    required String email,
    required String password,
    required String routName,
  }) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        if (kDebugMode) {
          print(value.user!.email);
        }
        await getData(context);
        navigatorTo(context, routName);
        isLoading = false;
        emit(LoginSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, "No user found for that email.");
        isLoading = false;
        emit(LoginFailureState());
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "Wrong password provided for that user.");
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
        emit(LoginFailureState());
      }

      isLoading = false;
      emit(LoginFailureState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading = false;
      showSnackBar(context, e.toString());
      emit(LoginFailureState());
    }
  }

  /// -***************** end ************************************************

  /// ************* google signin and save data of user **********************

  Future<void> signInWithGoogle(
    BuildContext context, {
    required String routName,
  }) async {
    emit(GoogleLoadingState());
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (kDebugMode) {
        print(user!.displayName.toString());
      }
      if (user != null) {
        _saveUserData(user);
        await getData(context);
        Navigator.popAndPushNamed(context, routName);
      }
      isLoadingForGoogle = false;
      emit(GoogleSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      isLoadingForGoogle = false;
      emit(GoogleFailureState());
    }
  }

  void sendNotify() async {
    userCredential!.user!.emailVerified;
    print("1");
    emit(SendNotify());
  }

  Future<void> _saveUserData(User user) async {
    try {
      String? token;
      String? phone='';
      await _fcm.getToken().then((value) {
        token = value!;
      });
      if(user.phoneNumber == null){
        phone = '0';
      }else{
        phone = user.phoneNumber;
      }
      await usersCollection.doc(user.uid).set({
        'id': user.uid,
        'displayName': user.displayName,
        'email': user.email,
        'phoneNumber':phone,
        'photoUrl': user.photoURL,
        'token': token!,
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getData(context) async {
    emit(DataLoadingState());

    model.clear();
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    try {
      usersCollection.snapshots().listen((event) {
        for (int i = 0; i < event.docs.length; i++) {
          Map map = event.docs[i].data() as Map;


          if (map['id'] == uid) {
            model.add(UsersModel.fromJson(event.docs[i]));
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
        getPassword();
        isDataLoading = false;
        emit(DataSuccessState());
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isDataLoading = false;
      emit(DataFailureState());
    }
  }
  void updateSwitchState( {
    required bool value,
  }) async{
    final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to insert the data
    final roomReference = databaseReference.child('open_door');

// Create a Map representing the data you want to insert
    final data = {
      'open_door': value,


    };

// Insert the data into the database
    roomReference.update(data);
  }
  void getPassword() {
    final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to read the data
    final roomReference = databaseReference.child('door');

// Read the data from the database
    roomReference.once().then((value) {
      Map mm = value.snapshot.value as Map;

      password = mm['door'];

      emit(Password());
    }).catchError((e) {
      print(e.toString());
    });
  }

  List<UsersModel> model = [];

  /// ************* end ****************************************************
  UserCredential? userCredential;

  /// -***************** signInWithEmailAndPassword ************************************************
  Future createUser(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String routName,
  }) async {
    emit(RegisterLoadingState());
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if(phoneNumber.isEmpty ){
        phoneNumber = '0';
      }else{
        phoneNumber =phoneNumber;
      }
      await userCredential!.user!.sendEmailVerification().then((value) {
        userCreated(
          email: email,
          name: name,
          phoneNumber: phoneNumber,
          id: userCredential!.user!.uid,
          emailVerified: userCredential!.user!.emailVerified,
        );
        Navigator.popAndPushNamed(context, routName);
        print("1");
      });

      //
      isLoading = false;

      emit(RegisterSuccessState());
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      isLoading = false;
      showSnackBar(context, e.toString());
      emit(RegisterFailureState());
    }
  }


  /// -***************** end ************************************************

  /// *************  save data of user **********************

  Future<void> userCreated({
    required String email,
    required bool emailVerified,
    required String name,
    required String phoneNumber,
    required String id,
  }) async {
    try {
      String? token;
      await _fcm.getToken().then((value) {
        token = value!;
      });
      await usersCollection.doc(id).set({
        'id': id,
        'displayName': name,
        'email': email,
        'phoneNumber': phoneNumber,
        'emailVerified': emailVerified,
        'photoUrl': phUrl,
        'token': token!,
      }).then((value) {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  /// ************* end ****************************************************
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  showDialog(context, pass, message) {
    QuickAlert.show(
        context: context,
        type: QuickAlertType.custom,
        confirmBtnText: 'Open',
        barrierDismissible: true,
        customAsset: 'assets/images/lock.gif',
        widget: CustomTextField(
          hintText: '*******',
          textEditingController: pass,
          obscureText: true,
          labelText: 'Password',
          iconData: Icons.lock_open_outlined,
          keyboardType: TextInputType.number,
          onChanged: (value) => message = value,
          decoration: InputDecoration(
            alignLabelWithHint: true,
          ),
          autofocus: true,
        ),
        onConfirmBtnTap: () async {
          if (message != password) {
            await QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                title: 'Wrong Password',
                titleColor: Colors.red,
                text: 'Try Again');
            return;
          }
          await Future.delayed(const Duration(milliseconds: 100));
          updateSwitchState(value: true );

          Navigator.pop(context);
          await Future.delayed(const Duration(milliseconds: 1000));
          await QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: "Opened",
          );
        });
  }
}
