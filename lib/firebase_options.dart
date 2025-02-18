// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDJh8tn2F0mCsMTYUdWgvCVmQP_-H9Yc_8',
    appId: '1:625554390329:web:d6f7cd626f8b34b1e2bce8',
    messagingSenderId: '625554390329',
    projectId: 'white-gym',
    authDomain: 'white-gym.firebaseapp.com',
    storageBucket: 'white-gym.firebasestorage.app',
    measurementId: 'G-WJC8Q11PLB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbLwzI7c8VWINb9Fu0mq-GVFxFe0uMVxU',
    appId: '1:625554390329:android:aa3c93b7aff4b714e2bce8',
    messagingSenderId: '625554390329',
    projectId: 'white-gym',
    storageBucket: 'white-gym.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-twaAVIR_22J4HEpq9QUBLnqNLgMdVAQ',
    appId: '1:625554390329:ios:f4c4adc4dc91f2bde2bce8',
    messagingSenderId: '625554390329',
    projectId: 'white-gym',
    storageBucket: 'white-gym.firebasestorage.app',
    iosBundleId: 'com.white.gym.app.whiteGym',
  );
}
