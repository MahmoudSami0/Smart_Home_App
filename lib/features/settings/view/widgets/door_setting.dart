import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smarthome/features/settings/controller/door_cubit.dart';

import '../../../../core/helper/show_snackBar.dart';
import '../../../../core/utils/widgets/custom_button.dart';

import '../../../../core/utils/widgets/custom_text_field.dart';



class DoorSetting extends StatelessWidget {
  const DoorSetting({Key? key,}) : super(key: key);

  static const String id = "DoorSetting";


  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();
    TextEditingController Oldpass = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
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
        child: BlocConsumer<DoorCubit, DoorState>(
          listener: (context, state){
             if(state is DataLoading){
                CircularProgressIndicator();

             }
          },
          builder: (context, state){
            var cubit = BlocProvider.of<DoorCubit>(context);

              return Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      obscureText: cubit.isPassword,
                      suffixIcon: cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onPressedIcon: () {
                        cubit.changepassword();
                      },
                      hintText: "Old Password",
                      textEditingController: Oldpass,
                      labelText: "Old Password",
                      iconData: Icons.password,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomTextField(
                      obscureText: cubit.isPassword,
                      suffixIcon: cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onPressedIcon: () {
                        cubit.changepassword();
                      },
                      hintText: "New Password",
                      textEditingController: pass,
                      labelText: "New Password",
                      iconData: Icons.password,
                    ),
                    CustomButton(
                        onTap: () {
                          print(cubit.password);
                          if (Oldpass.text == cubit.password) {
                            cubit.changeDoorPassword(value: pass.text);


                            showSnackBar(context, "The Password is Changed");
                            Future.delayed(const Duration(milliseconds: 1000));
                            Navigator.pop(context);

                          } else {
                            showSnackBar(context, "The Old Password Wrong");
                          }

                        },
                        btnText: "Change")


                  ],
                ),
              );


          },
        ),
      ),
    );
  }
}
