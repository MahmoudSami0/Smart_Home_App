import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smarthome/features/auth/profile/account/controller/edit_cubit.dart';
import 'constants.dart';
import 'features/Home/controller/home_cubit.dart';
import 'features/Home/controller/weather_cubit.dart';
import 'features/Home/view/home_view.dart';
import 'features/Rooms/bath_room/controller/bath_room_cubit.dart';
import 'features/Rooms/bed_room/controller/bed_room_cubit.dart';
import 'features/Rooms/garage/controller/garage_room_cubit.dart';
import 'features/Rooms/kitchen/controller/kitchen_room_cubit.dart';
import 'features/Rooms/living_room/controller/living_room_cubit.dart';
import 'features/auth/Login/controller/login_cubit.dart';
import 'features/auth/Login/view/login_view.dart';
import 'features/auth/profile/controller/profile_cubit.dart';
import 'features/notifications/controller/notifictions_cubit.dart';
import 'features/settings/controller/connection_cubit.dart';
import 'features/settings/controller/door_cubit.dart';
import 'features/settings/controller/wifi_cubit.dart';

bool isLogin = false;
bool? emailVerified;
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    Permission.location.request();

    if (user == null) {
      isLogin = false;
      if (kDebugMode) {
        print('User is currently signed out!');
      }
    } else {
      NotificationSetting().massedges();
      isLogin = true;
      emailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (kDebugMode) {
        print('User is signed in!');
      }
    }
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
            ),
          ));
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit()..getData(context),
        ),
        BlocProvider(
            create: (context) => WeatherCubit()
              ..getWeather()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => EditCubit()..getData(context)),
        BlocProvider(create: (context) => NotificationsCubit()..getData()),
        BlocProvider(create: (context) => WifiCubit()..wifiScan()),
        BlocProvider(create: (context) => LivingRoomCubit()..getdata()),
        BlocProvider(create: (context) => BedRoomCubit()..getdata()),
        BlocProvider(create: (context) => BathRoomCubit()..getdata()),
        BlocProvider(create: (context) => GarageRoomCubit()..getdata()),
        BlocProvider(create: (context) => KitchenCubit()..getdata()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => ConnectionCubit()),
        BlocProvider(create: (context) => DoorCubit()..getPassword())
      ],
      child: MaterialApp(
        title: 'Smart Home',
        initialRoute: isLogin ? HomeView.id : LoginView.id,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
        ),
        routes: routes,
      ),
    );
  }
}

class NotificationSetting {
  final CollectionReference notiCollection =
      FirebaseFirestore.instance.collection('masseges');
  String? idm = FirebaseAuth.instance.currentUser!.uid;
  void massedges() {
    // fcm.requestPermission();
    FirebaseMessaging.onMessage.listen((message) async {
      await notiCollection.doc(message.messageId).set({
        "uid": idm,
        'id': message.messageId,
        'body': message.notification!.body,
        'title': message.notification!.title,
        'time': message.sentTime,
      });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      await notiCollection.doc(message.messageId).set({
        "uid": idm,
        'id': message.messageId,
        'body': message.notification!.body,
        'title': message.notification!.title,
        'time': message.sentTime,
      });
    });
  }
}
