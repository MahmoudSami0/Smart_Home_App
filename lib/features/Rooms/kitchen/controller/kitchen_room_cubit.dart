

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter_bloc/flutter_bloc.dart';






part 'kitchen_room_state.dart';

class KitchenCubit extends Cubit<KitchenState> {
  KitchenCubit() : super(KitchenInitial());



   List myDevices = [];


  powerSwitchChanged(bool value, int index) async{

    myDevices[index][2] = value;
    print(myDevices[index]);
    if(myDevices[index][0] == 'Smart Light') {

      updateSwitchState(value:value ,path: 'light');
    }else{
        updateSwitchState(value: value,path: 'Gas Key');
    }


    emit(PowerSwitchState());
  }




  void updateSwitchState( {
    required bool value,required String path
}) async{
    final databaseReference = FirebaseDatabase.instance.ref();

// Get a reference to the location where you want to insert the data
    final roomReference = databaseReference.child('rooms').child('Kitchen');

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
    final roomReference = databaseReference.child('rooms').child('Kitchen');


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
        ['Water Key', 'assets/images/air-conditioner.png', mm['Gas Key']],
      ];
      emit(DataSuccess());
    }).catchError((e){
      print(e.toString());
      emit(DataFailure());
    });

  }

}




