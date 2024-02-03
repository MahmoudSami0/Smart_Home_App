import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/constants.dart';
import 'package:smarthome/features/Home/view/widgets/custom_app_bar.dart';
import 'package:smarthome/features/Rooms/living_room/controller/living_room_cubit.dart';


import '../../../../../core/utils/widgets/custom_text.dart';

import '../../../../auth/Login/controller/login_cubit.dart';
import '../../../../auth/Login/model/user_model.dart';
import 'living_item_builder.dart';

class LivingViewBody extends StatelessWidget {
  const LivingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersModel model = BlocProvider
        .of<LoginCubit>(context)
        .model[0];
    return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/living-room.jpg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(color: tColor, url: model,),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Living Room,",
                        fontSize: 30,
                        isBold: true,
                        color: headingColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Let's Control It",
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Center(
                    child: CustomText(
                      text: "Devices",
                      fontSize: 30,
                      isBold: true,
                      textAlign: TextAlign.end,
                    )),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<LivingRoomCubit,LivingRoomState>(
                  builder: (context, state) {
                    if(state is DataLoading){
                      return const Center(child: CircularProgressIndicator(),);
                    }else{
                      return LivingItemBuilder();
                    }

                  },
                ),
              ],
            ),
          ),
        ));
  }
}
