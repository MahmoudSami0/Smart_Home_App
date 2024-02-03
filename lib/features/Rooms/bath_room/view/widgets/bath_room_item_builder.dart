import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../controller/bath_room_cubit.dart';
import 'bath_room_item.dart';

class BathRoomItemBuilder extends StatelessWidget {
  BathRoomItemBuilder({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BathRoomCubit, BathRoomState>(


        builder: (context, state) {
      var cubit =BlocProvider.of<BathRoomCubit>(context);
      return  Expanded(

      child: GridView.builder(
        itemCount: cubit.myDevices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
        itemBuilder: (context, index) {
          return BathRoomItem(
            deviceName: cubit.myDevices[index][0],
            iconPath: cubit.myDevices[index][1],
            powerOn: cubit.myDevices[index][2],
            onChanged: (value) => cubit.powerSwitchChanged(value, index),
          );
        },
      ),
    );});
  }
}
