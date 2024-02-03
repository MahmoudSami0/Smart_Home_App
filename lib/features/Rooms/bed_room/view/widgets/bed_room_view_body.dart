import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_text.dart';

import '../../../../Home/view/widgets/custom_app_bar.dart';
import '../../../../auth/Login/controller/login_cubit.dart';
import '../../../../auth/Login/model/user_model.dart';
import '../../controller/bed_room_cubit.dart';
import 'bed_room_item_builder.dart';

class BedRoomViewBody extends StatelessWidget {
  const BedRoomViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersModel model = BlocProvider.of<LoginCubit>(context).model[0];
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bedroom-background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(color: tColor, url: model,),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Column(
                  children: [
                    CustomText(
                      text: "Bed Room,",
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
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Center(
                  child: CustomText(
                text: "Devices",
                fontSize: 30,
                isBold: true,
                textAlign: TextAlign.end,
                color: offColor,
              )),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<BedRoomCubit,BedRoomState>(
                builder: (context, state) {
                  if(state is DataLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return BedRoomItemBuilder ();
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
