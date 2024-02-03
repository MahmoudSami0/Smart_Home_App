

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter_bloc/flutter_bloc.dart';






part 'bed_room_state.dart';

class BedRoomCubit extends Cubit<BedRoomState> {
  BedRoomCubit() : super(BedRoomInitial());



   List myDevices = [ ];


  powerSwitchChanged(bool value, int index) async{

    myDevices[index][2] = value;
    print(myDevices[index]);
    if(myDevices[index][0] == 'Smart Light') {

      updateSwitchState(value:value ,path: 'light');
    }else if(myDevices[index][0] == 'Smart AC'){
      updateSwitchState(value: value,path: 'Ac');
    }else if(myDevices[index][0] == 'Smart TV'){
      updateSwitchState(value: value,path: 'Tv');
    }else{
      updateSwitchState(value: value,path: 'Fan');
    }


    emit(PowerSwitchState());
  }




  void updateSwitchState( {
    required bool value,required String path
}) async{
    final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to insert the data
    final roomReference = databaseReference.child('rooms').child('bed_room');

// Create a Map representing the data you want to insert
    final data = {
      path: value,


    };

// Insert the data into the database
    roomReference.update(data);
   }
 void getdata(){
     emit(DataLoading());

    final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to read the data
    final roomReference = databaseReference.child('rooms').child('bed_room');


// Read the data from the database
    roomReference.once().then((value){
      print("""
      **************************************
      ${value.snapshot.value}
      ------------------------------------------
      
      
      """);
      Map mm = value.snapshot.value as Map;

      myDevices = [
        ['Smart Light', 'assets/images/light-bulb.png', mm['light']],
        ['Smart AC', 'assets/images/air-conditioner.png', mm['Ac']],
        ['Smart TV', 'assets/images/smart-tv.png', mm['Tv']],
        ['Smart Fan', 'assets/images/fan.png', mm['Fan']],
      ];
      emit(DataSuccess());
    }).catchError((e){
      print(e.toString());
      emit(DataFailure());
    });

  }

}




