import 'package:bloc/bloc.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';

import '../../../core/helper/send_notification.dart';

part 'door_state.dart';

class DoorCubit extends Cubit<DoorState> {
  DoorCubit() : super(DoorInitial());
  bool isPassword = true;
  String password ='';
  void changepassword() {
    isPassword = !isPassword;
    emit(PasswordState());
  }

  void changeDoorPassword( {
    required String value,
  }) async{
    emit(ChangePasswordLoading());
    try{
      final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to insert the data
      final roomReference = databaseReference.child('door');
// Create a Map representing the data you want to insert
      final data = {
        'door': value,
      };
      String?  t = await FirebaseMessaging.instance.getToken();
      SendNotification.sendNotification(body: "Door Password Is changed", title: "Door Password", token: t!);
// Insert the data into the database
      roomReference.update(data);
      emit(ChangePasswordState());
    }catch(e){
      print(e.toString());
      emit(ChangePasswordFailure());
    }

  }

  void getPassword(){
    emit(DataLoading());

    final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to read the data
    final roomReference = databaseReference.child('door');


// Read the data from the database
    roomReference.once().then((value){

      Map mm = value.snapshot.value as Map;

      password = mm['door'];

      emit(DataSuccess());
    }).catchError((e){
      print(e.toString());
      emit(DataFailure());
    });

  }
}
