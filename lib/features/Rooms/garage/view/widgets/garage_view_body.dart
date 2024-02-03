import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_text.dart';

import '../../../../Home/view/widgets/custom_app_bar.dart';
import '../../../../auth/Login/controller/login_cubit.dart';
import '../../../../auth/Login/model/user_model.dart';
import '../../controller/garage_room_cubit.dart';
import 'garage_item_builder.dart';

class GarageViewBody extends StatelessWidget {
  const GarageViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersModel model = BlocProvider.of<LoginCubit>(context).model[0];
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/garage.jpg'),
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
                child: CustomText(
                  text: "Garage",
                  fontSize: 30,
                  isBold: true,
                  color: headingColor,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              BlocBuilder<GarageRoomCubit, GarageRoomState>(
                builder: (context, state) {
                  if(state is DataLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return  GarageItemBuilder();
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
