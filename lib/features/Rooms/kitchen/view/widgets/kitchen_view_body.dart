import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_text.dart';

import '../../../../Home/view/widgets/custom_app_bar.dart';
import '../../../../auth/Login/controller/login_cubit.dart';
import '../../../../auth/Login/model/user_model.dart';
import '../../controller/kitchen_room_cubit.dart';
import 'kitchen_item_builder.dart';


class KitchenViewBody extends StatelessWidget {
  const KitchenViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersModel model = BlocProvider.of<LoginCubit>(context).model[0];
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/kitchenroom.jpg'),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Kitchen,",
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
                    color: blackWithOpacity,
                  )),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<KitchenCubit, KitchenState>(
                builder: (context, state) {
                  if(state is DataLoading){
                    return const Center(child: CircularProgressIndicator(),);
                  }else{
                    return  KitchenItemBuilder();
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

///////////