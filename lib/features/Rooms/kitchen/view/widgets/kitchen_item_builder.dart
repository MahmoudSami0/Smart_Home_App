import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/kitchen_room_cubit.dart';
import 'kitchen_item.dart';



class KitchenItemBuilder extends StatelessWidget {
  KitchenItemBuilder({Key? key}) : super(key: key);

  ////////// Will Be Added Into Cubit


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KitchenCubit, KitchenState>(


        builder: (context, state) {
      var cubit =BlocProvider.of<KitchenCubit>(context);
      return Expanded(
      child: GridView.builder(
        itemCount: cubit.myDevices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
        itemBuilder: (context, index) {
          return KitchenItem(
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
