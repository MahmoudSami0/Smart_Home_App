import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/bed_room_cubit.dart';
import 'bed_room_item.dart';

class BedRoomItemBuilder extends StatelessWidget {
  BedRoomItemBuilder({Key? key}) : super(key: key);

  ////////// Will Be Added Into Cubit

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BedRoomCubit, BedRoomState>(


        builder: (context, state) {
      var cubit =BlocProvider.of<BedRoomCubit>(context);
      return  Expanded(
      child: GridView.builder(
        itemCount: cubit.myDevices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
        itemBuilder: (context, index) {
          return BedRoomItem(
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
