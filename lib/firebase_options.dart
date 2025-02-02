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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyByeA-Nnh7ODhPc1LIEQTaR3xzYvP17mSI',
    appId: '1:464745623805:web:24063b9dda973694b54e94',
    messagingSenderId: '464745623805',
    projectId: 'findme-732b8',
    authDomain: 'findme-732b8.firebaseapp.com',
    storageBucket: 'findme-732b8.appspot.com',
    measurementId: 'G-0LBFXL2G4W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgGOBWb3yJelXRAvmj6ET-vq5QZDDxSOE',
    appId: '1:464745623805:android:a9b9deb63b54e85ab54e94',
    messagingSenderId: '464745623805',
    projectId: 'findme-732b8',
    storageBucket: 'findme-732b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYToee6Og8D1l5EeDNrD59tftXVlhK8gA',
    appId: '1:464745623805:ios:a4901b142247beceb54e94',
    messagingSenderId: '464745623805',
    projectId: 'findme-732b8',
    storageBucket: 'findme-732b8.appspot.com',
    iosBundleId: 'com.example.findMeAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYToee6Og8D1l5EeDNrD59tftXVlhK8gA',
    appId: '1:464745623805:ios:a4901b142247beceb54e94',
    messagingSenderId: '464745623805',
    projectId: 'findme-732b8',
    storageBucket: 'findme-732b8.appspot.com',
    iosBundleId: 'com.example.findMeAdmin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyByeA-Nnh7ODhPc1LIEQTaR3xzYvP17mSI',
    appId: '1:464745623805:web:eca04dd3d3fd013fb54e94',
    messagingSenderId: '464745623805',
    projectId: 'findme-732b8',
    authDomain: 'findme-732b8.firebaseapp.com',
    storageBucket: 'findme-732b8.appspot.com',
    measurementId: 'G-J7112E1SXL',
  );

}