import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/features/Home/view/home_view.dart';

import 'package:smarthome/features/auth/Login/controller/login_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../rgester/view/register_view.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context,state){

        if(state is LoginLoadingState){
          BlocProvider.of<LoginCubit>(context).isLoading = true;
        }
      },
      builder: (context, state) {
        var cuibt = BlocProvider.of<LoginCubit>(context);
        return Form(
          key: formKey,
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Welcome,",
                          isBold: true,
                          fontSize: 30,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          text: "Sign in to Continue",
                          //color: Color(0x0f929292),
                          fontSize: 18,
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: const CustomText(
                          text: "SignUp",
                          color: kColor,
                          isBold: true,
                          fontSize: 20,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextField(
                  textEditingController: email,
                  iconData: Icons.email,
                  labelText: "Email",
                  hintText: "example123@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  textEditingController: password,
                  iconData: Icons.password_outlined,
                  suffixIcon: cuibt.isPassword
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onPressedIcon: () {
                    cuibt.changepassword();
                  },
                  labelText: "Password",
                  hintText: "********",
                  keyboardType: TextInputType.text,
                  obscureText: cuibt.isPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: CustomText(
                    text: "Forgot Password?",
                    fontSize: 14,
                    // color: Color(0x0f929292),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                cuibt.isLoading ? const CircularProgressIndicator() : CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      cuibt
                          .loginUser(context,email: email.text, password: password.text,routName: HomeView.id);
                    }
                  },
                  btnText: 'SignIn',
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
