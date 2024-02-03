import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smarthome/features/auth/Login/controller/login_cubit.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';
import '../../../../Home/view/home_view.dart';


class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();

    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          BlocProvider.of<LoginCubit>(context).isLoading = true;
        }
      },
      builder: (context, state) {
        var cuibt = BlocProvider.of<LoginCubit>(context);
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Register",
                          isBold: true,
                          fontSize: 30,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "Register Now To Control The Home",
                          color: Colors.grey,
                          maxLines: 2,
                          fontSize: 18,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      textEditingController: name,
                      iconData: Icons.account_box,
                      labelText: "Name",
                      hintText: "Your Name",
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 30,
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
                    CustomTextField(
                      textEditingController: phone,
                      iconData: Icons.phone,
                      labelText: "Phone",
                      hintText: "01234567891",
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    cuibt.isLoading
                        ? Center(child: const CircularProgressIndicator())
                        : CustomButton(
                            onTap: () async {
                             // Navigator.pushNamed(context, );
                              // if (formKey.currentState!.validate()) {
                                cuibt.createUser(context,
                                    email: email.text,
                                    password: password.text,
                                    routName: HomeView.id,
                                    name: name.text,
                                    phoneNumber: phone.text);

                              // }
                            },
                            btnText: 'SignUp',
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
