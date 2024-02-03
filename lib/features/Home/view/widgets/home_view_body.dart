
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:smarthome/constants.dart';
import 'package:smarthome/core/utils/widgets/custom_button.dart';

import 'package:smarthome/features/Home/view/widgets/weather_card.dart';
import 'package:smarthome/features/auth/Login/controller/login_cubit.dart';

import '../../../../core/utils/widgets/custom_text.dart';
import '../../../../main.dart';
import '../../../auth/Login/model/user_model.dart';
import '../../controller/weather_cubit.dart';
import '../../controller/weather_state.dart';
import 'custom_app_bar.dart';
import 'list_view_item_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);
  static const String id = "HomeViewBody";
  @override
  Widget build(BuildContext context) {
    TextEditingController pass = TextEditingController();

    var message;



    Loading() {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          title: 'Loading...',
          text: 'Fetching Your Data');
    }

    return SafeArea(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is DataLoadingState) {
            BlocProvider.of<LoginCubit>(context).isDataLoading = true;
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<LoginCubit>(context);
          if (cubit.model.length == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            UsersModel model = cubit.model[0];
            return cubit.isDataLoading
                ? Center(
                    child: Loading(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            color: Colors.black,
                            url: model,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        emailVerified!
                              ? SizedBox(
                                  height: 5,
                                )
                              : Container(
                                  padding: EdgeInsets.all(5),
                                  width: double.infinity,
                                  color: Colors.amberAccent.shade100,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CustomText(
                                          text: "Please Verify Your Email"),
                                      Expanded(
                                          child: TextButton(
                                              onPressed: () {
                                                cubit.sendNotify();
                                              },
                                              child: CustomText(
                                                text: "Send",
                                                color: kColor,
                                              )))
                                    ],
                                  ),
                                ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Hi ${model.name},",
                                  fontSize: 30,
                                  isBold: true,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const CustomText(
                                  text: "Welcome To Your Smart Home",
                                  fontSize: 20,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10.0),
                          //   child: const CustomText(
                          //     text: "OutDoor",
                          //     fontSize: 22,
                          //     isBold: true,
                          //     color: Colors.black,
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: BlocBuilder<WeatherCubit, WeatherStates>(
                              builder: (context, state) {
                                if (state is WeatherLoaded) {
                                  return WeatherCard(
                                    weather: state.weather,
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  onTap: (){
                                    cubit.getPassword();
                                   cubit.showDialog(context, pass, message);
                                  },
                                  btnText: 'Open Door',
                                  height: 40,
                                  width: (MediaQuery.of(context).size.width / 2) - 50,
                                  color: Colors.cyan,
                                ),
                                CustomButton(
                                  onTap: () async{
                                    cubit.updateSwitchState(value: false );
                                    await Future.delayed(const Duration(milliseconds: 1000));
                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        title: 'Closed');
                                  }
                                  ,
                                  btnText: 'Close Door',
                                  height: 40,
                                  width: (MediaQuery.of(context).size.width / 2) - 50,
                                  color: Colors.cyan,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: const CustomText(
                              text: "Rooms",
                              fontSize: 28,
                              isBold: true,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListViewItemBuilder()
                        ],
                      ),
                    ),
                  );
          }
        },
      ),
    );
  }
}
