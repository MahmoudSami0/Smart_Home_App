

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text.dart';
import '../../../../core/utils/widgets/custom_text_field.dart';
import '../../../Home/view/home_view.dart';
import '../../controller/connection_cubit.dart';

class ConnectionSetting extends StatelessWidget {
  ConnectionSetting({Key? key, required this.ssidName}) : super(key: key);

  static const String id = "ConnectionSetting";
  final String ssidName;


  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setup Connection",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30,
              ),
            )),
      ),
      body: SafeArea(
        child: BlocBuilder<ConnectionCubit, ConnectionStates>(
          builder: (context, state) {
            var cuibt = BlocProvider.of<ConnectionCubit>(context);
            return Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[300]),
                      child: Center(
                          child: CustomText(
                            text: ssidName,
                            isBold: true,
                            fontSize: 32,
                          ))),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                    obscureText: cuibt.isPassword,
                    suffixIcon: cuibt.isPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressedIcon: () {
                      cuibt.changepassword();
                    },
                    hintText: "Wifi Password",
                    textEditingController: pass,
                    labelText: "Password",
                    iconData: Icons.password,
                  ),
                  CustomButton(
                      onTap: () {
                        cuibt.sendCredentials(ssidName, pass.text).then((value) {
                          Navigator.popAndPushNamed(context, HomeView.id);
                        });

                      },
                      btnText: "Connect ")
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
