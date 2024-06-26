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
    apiKey: 'AIzaSyDhtxGZ6yZF_mABA5vHJMn5ic4xr7U-3VA',
    appId: '1:795339817494:web:83fb81266dde07947b6b37',
    messagingSenderId: '795339817494',
    projectId: 'app-construa-facil',
    authDomain: 'app-construa-facil.firebaseapp.com',
    storageBucket: 'app-construa-facil.appspot.com',
    measurementId: 'G-0H02WGK67X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAejwEWa9BStJnzDqPicUHfzlLMBUBuSPM',
    appId: '1:795339817494:android:137ec03aee4fdc2d7b6b37',
    messagingSenderId: '795339817494',
    projectId: 'app-construa-facil',
    storageBucket: 'app-construa-facil.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVef-I9ptY5jsklXp_HSFXbaZzl7S3XN4',
    appId: '1:795339817494:ios:8f06ac7e930362a67b6b37',
    messagingSenderId: '795339817494',
    projectId: 'app-construa-facil',
    storageBucket: 'app-construa-facil.appspot.com',
    iosBundleId: 'com.example.construafacil',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVef-I9ptY5jsklXp_HSFXbaZzl7S3XN4',
    appId: '1:795339817494:ios:ba45880da330973f7b6b37',
    messagingSenderId: '795339817494',
    projectId: 'app-construa-facil',
    storageBucket: 'app-construa-facil.appspot.com',
    iosBundleId: 'n',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhtxGZ6yZF_mABA5vHJMn5ic4xr7U-3VA',
    appId: '1:795339817494:web:ae184e003d177c0b7b6b37',
    messagingSenderId: '795339817494',
    projectId: 'app-construa-facil',
    authDomain: 'app-construa-facil.firebaseapp.com',
    storageBucket: 'app-construa-facil.appspot.com',
    measurementId: 'G-GPN03J08VC',
  );
}
