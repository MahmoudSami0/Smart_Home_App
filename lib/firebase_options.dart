// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAx8hXfZP35Z7WNLFXXUSlbOd0_ZvFliCQ',
    appId: '1:454845041230:web:41dcf37e7bc2e89212d11f',
    messagingSenderId: '454845041230',
    projectId: 'smart-home-29346',
    authDomain: 'smart-home-29346.firebaseapp.com',
    storageBucket: 'smart-home-29346.appspot.com',
    measurementId: 'G-G26W8M490B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADkRHqIu-bWFtd-AjNoQqqaI2BZlC2epM',
    appId: '1:454845041230:android:20d66f473c87a41712d11f',
    messagingSenderId: '454845041230',
    projectId: 'smart-home-29346',
    storageBucket: 'smart-home-29346.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgq4kTZD5t-Td_iXIk_vxUwS9gzzvIdf4',
    appId: '1:454845041230:ios:a0c31fcf4e9eb8bf12d11f',
    messagingSenderId: '454845041230',
    projectId: 'smart-home-29346',
    storageBucket: 'smart-home-29346.appspot.com',
    iosClientId: '454845041230-pep1juhm1gracp80ls8efahun3mc502q.apps.googleusercontent.com',
    iosBundleId: 'com.example.smarthome',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgq4kTZD5t-Td_iXIk_vxUwS9gzzvIdf4',
    appId: '1:454845041230:ios:2f07967026d0271912d11f',
    messagingSenderId: '454845041230',
    projectId: 'smart-home-29346',
    storageBucket: 'smart-home-29346.appspot.com',
    iosClientId: '454845041230-drt6bnecn7n6mucgf7d4cfgiajum8uv5.apps.googleusercontent.com',
    iosBundleId: 'com.example.smarthome.RunnerTests',
  );
}