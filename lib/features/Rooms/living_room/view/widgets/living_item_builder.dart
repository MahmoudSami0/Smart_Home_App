import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/living_room_cubit.dart';
import 'living_item.dart';

class LivingItemBuilder extends StatelessWidget {
  const LivingItemBuilder({super.key});


  ////////// Will work after create cubit //////////


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<LivingRoomCubit, LivingRoomState>(


      builder: (context, state) {
        var cubit =BlocProvider.of<LivingRoomCubit>(context);
        return Expanded(
          child: GridView.builder(
            itemCount: cubit.myDevices.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1 / 1.2),
            itemBuilder: (context, index) {
              return LivingItem(
                deviceName: cubit.myDevices[index][0],
                iconPath: cubit.myDevices[index][1],
                powerOn: cubit.myDevices[index][2],
                onChanged: (value) => cubit.powerSwitchChanged(value, index),
              );
            },
          ),
        );
      },
    );
  }
}
