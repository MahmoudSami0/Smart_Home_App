
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

import '../controller/edit_cubit.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
  

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: BlocBuilder<EditCubit, EditState>(

        builder: (context, state) {

         var cubit = BlocProvider.of<EditCubit>(context);
          if(state is DataSuccessState){
            name.text = state.model.name;

            phone.text = state.model.phone;


            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                        const CustomText(
                          text: "Edit Profile",
                          isBold: true,
                          fontSize: 30,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Image.network(
                              state.model.photoUrl,

                              width: MediaQuery.of(context).size.width*0.6,
                              height: 100,
                            ),
                            CustomButton(btnText: "Image",onTap: ()async{
                              await cubit.pik();
                            },width: 100, )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          textEditingController: name,
                          iconData: Icons.account_box,
                          onChanged: (value) {

                            value =  state.model.name;
                          },
                          hintText: "Your Name",
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          textEditingController: email,
                          iconData: Icons.email,
                          labelText:  state.model.email,
                          enabled: false,
                          hintText: "example123@gmail.com",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // CustomTextField(
                        //   textEditingController: password,
                        //   iconData: Icons.password_outlined,
                        //   suffixIcon: cubit.isPassword
                        //       ? Icons.visibility
                        //       : Icons.visibility_off,
                        //   onPressedIcon: () {
                        //     cubit.changepassword();
                        //   },
                        //   labelText: "Password",
                        //   hintText: "********",
                        //   keyboardType: TextInputType.text,
                        //   obscureText: cubit.isPassword,
                        // ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          textEditingController: phone,
                          iconData: Icons.phone,
                          onChanged: (value) {

                            value =  state.model.phone;
                          },
                          labelText: "Phone",
                          hintText: "01234567891",
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        cubit.upIsLoading
                            ? Center(child: const CircularProgressIndicator())
                            : CustomButton(
                          onTap: () async {
                            // Navigator.pushNamed(context, );
                            // if (formKey.currentState!.validate()) {
                            cubit.userUpdate(context,
                                name: name.text,
                                phone: phone.text,
                                emailVerified: true,
                                id: state.model.uid);

                            // }
                          },
                          btnText: 'Save',
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
          }else{
            return Center(child: CircularProgressIndicator(),);
          }



        },
      ),
    );
  }
}
