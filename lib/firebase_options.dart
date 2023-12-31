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
    apiKey: 'AIzaSyA57Sw4FxIfjhyryQhKbnvyPJJyYvPvDSE',
    appId: '1:964108833235:web:03af2832537ef1a5af9f26',
    messagingSenderId: '964108833235',
    projectId: 'travelapp-26466',
    authDomain: 'travelapp-26466.firebaseapp.com',
    storageBucket: 'travelapp-26466.appspot.com',
    measurementId: 'G-P0BC1BQHMG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnrqHV5ZVpAIBX3binHqcsRvG-Y0HXrJg',
    appId: '1:964108833235:android:5f1565274c416826af9f26',
    messagingSenderId: '964108833235',
    projectId: 'travelapp-26466',
    storageBucket: 'travelapp-26466.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyxgmyMQrJ_jUAz9nxuyEFJzKaolJCJuc',
    appId: '1:964108833235:ios:62e0dae002942366af9f26',
    messagingSenderId: '964108833235',
    projectId: 'travelapp-26466',
    storageBucket: 'travelapp-26466.appspot.com',
    iosBundleId: 'com.example.travelapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyxgmyMQrJ_jUAz9nxuyEFJzKaolJCJuc',
    appId: '1:964108833235:ios:776904d86ceb79dcaf9f26',
    messagingSenderId: '964108833235',
    projectId: 'travelapp-26466',
    storageBucket: 'travelapp-26466.appspot.com',
    iosBundleId: 'com.example.travelapp.RunnerTests',
  );
}
