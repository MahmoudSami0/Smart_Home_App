import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/features/auth/Login/controller/login_cubit.dart';

import '../../../../../core/utils/widgets/custom_icon_button.dart';
import '../../../../../core/utils/widgets/custom_text.dart';
import '../../../../Home/view/home_view.dart';


class SocialBody extends StatelessWidget {
  const SocialBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context,state){
        if(state is GoogleLoadingState){
          BlocProvider.of<LoginCubit>(context).isLoadingForGoogle = true;
        }
      },
      builder: (context, state) {
        return    BlocProvider.of<LoginCubit>(context).isLoadingForGoogle ? const Center(child: CircularProgressIndicator(),) : Column(
          children: [

            const SizedBox(
              height: 20,
            ),
            const CustomText(text: "___ OR ___"),
            const SizedBox(
              height: 30,
            ),
            CustomIconButton(
              imgUrl: "assets/images/Icon_Facebook.png",
              text: "Sign In with Facebook",
              onTab: () {

              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomIconButton(
              imgUrl: "assets/images/icons8_Google_2.png",
              text: "Sign In with Google",
              onTab: () {

                BlocProvider.of<LoginCubit>(context).signInWithGoogle(context, routName: HomeView.id);
              },
            ),
          ],
        );
      },
    );
  }
}
