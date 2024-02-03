
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smarthome/features/Home/view/widgets/home_view_body.dart';
import 'package:smarthome/features/auth/profile/view/profile_view.dart';
import 'package:smarthome/features/notifications/view/notifications_view.dart';

import '../../settings/view/setting_view.dart';
import '../../settings/view/widgets/wifi_list_vew.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Widget> screens = const [
    HomeViewBody(),
    NotificationsView(),
    SettingView(),
    ProfileView(),
    WifiListViewBuilder(),
  ];

  int index = 0;

  void changeBottom(int ind) {
    index = ind;
    emit(BottomNavigatorState());
  }



}
