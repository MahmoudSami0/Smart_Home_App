import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/features/Home/controller/home_cubit.dart';

import '../../notifications/controller/notifictions_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String id = "HomeView";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: cubit.screens[cubit.index],
          bottomNavigationBar: CurvedNavigationBar(
              height: 65,
              index: cubit.index,
              onTap: (index) {
                cubit.changeBottom(index);
              },
              backgroundColor: Colors.grey.shade200,
              items: [
                Icon(
                  Icons.home,
                  size: 30,
                ),
                BlocBuilder<NotificationsCubit, NotificationsState>(
                  builder: (context, state) {
                    if (state is NotificationsSuccessState) {
                      if (state.model.isEmpty) {
                        return Icon(
                          Icons.notifications,
                        );
                      } else {
                        return Stack(alignment: Alignment.topRight, children: [
                          Icon(
                            Icons.notifications,
                          ),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.red,
                          ),
                        ]);

                      }
                    }else{
                      return Icon(
                        Icons.notifications,
                      );
                    }
                  },
                ),
                Icon(Icons.settings),
                Icon(Icons.account_box)
              ]),
        );
      },
    );
  }
}
