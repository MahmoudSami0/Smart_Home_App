import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/garage_room_cubit.dart';
import 'garage_item.dart';



class GarageItemBuilder extends StatelessWidget {
  GarageItemBuilder({Key? key}) : super(key: key);

  ////////// Will Be Added Into Cubit



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GarageRoomCubit, GarageRoomState>(


        builder: (context, state) {
      var cubit =BlocProvider.of<GarageRoomCubit>(context);
      return  Expanded(
      child: GridView.builder(
        itemCount: cubit.myDevices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
        itemBuilder: (context, index) {
          return GarageItem(
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
