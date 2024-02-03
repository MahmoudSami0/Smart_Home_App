import 'package:flutter/material.dart';

import 'features/Home/view/home_view.dart';

import 'features/Rooms/bath_room/view/bath_room_view.dart';

import 'features/Rooms/bed_room/view/bed_room_view.dart';

import 'features/Rooms/garage/view/garage_view.dart';

import 'features/Rooms/kitchen/view/kitchen_view.dart';

import 'features/Rooms/living_room/view/living_room_view.dart';

import 'features/auth/Login/view/login_view.dart';

import 'features/auth/profile/view/profile_view.dart';
import 'features/auth/rgester/view/register_view.dart';

import 'features/settings/view/widgets/door_setting.dart';
import 'features/settings/view/widgets/wifi_scan_body.dart';

const kColor = Color(0xff00C569);
const tColor = Color(0xff070707);
const bgColor = Color(0xFFEEEEEE);
const offColor = Color(0xFFFFFFFF);
const whiteWithOpacity = Color(0x76ffffff);
const blackWithOpacity = Color(0xBD000000);
const headingColor = Color(0xFF393D3F);
const appBarColor = Color(0x28ffffff);
const fcmServerKey =
    "AAAAaebgik4:APA91bEYlNTykstnYyn_3SuwbpokSEe8W-S7xJMaVX8BCYwwuHCdmGZDzUPzVxQAWETebzB8Sb0svVo-NOKGzVuATJHVvURcBipddsHx1fX9Eg0UrsTYAwGBqb2DO2r5vSz2ACwo8KBy";
const fcmEndpointUrl = "https://fcm.googleapis.com/fcm/send";
const phUrl =
    "https://firebasestorage.googleapis.com/v0/b/smart-home-29346.appspot.com/o/pngegg.png?alt=media&token=28910b48-2710-4171-bf1f-6b361f197adb";
const apiKey = "fc48eb986452c2cce44a7a3394aabe27";

class Images {
  Images._();
  static const String cloudyAnim = 'assets/anims/cloudy.json';
  static const String cloudyMain = 'assets/anims/cloudy_main.json';
}

Map<String, Widget Function(BuildContext)> routes = {
  LoginView.id: (context) => const LoginView(),
  HomeView.id: (context) => const HomeView(),
  ProfileView.id: (context) => const ProfileView(),
  LivingView.id: (context) => const LivingView(),
  BedRoomView.id: (context) => const BedRoomView(),
  BathRoomView.id: (context) => const BathRoomView(),
  KitchenView.id: (context) => const KitchenView(),
  GarageView.id: (context) => const GarageView(),
  RegisterView.id: (context) => const RegisterView(),
  WifiScanBody.id: (context) => const WifiScanBody(),
  DoorSetting.id: (context) => const DoorSetting(),
};

