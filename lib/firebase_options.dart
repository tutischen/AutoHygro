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
    apiKey: 'AIzaSyBMTad_MBUW7QCObXhqqp6PtQ_UDzR4izI',
    appId: '1:1035799126686:web:0a6cc1ee2a0f402f9ad18f',
    messagingSenderId: '1035799126686',
    projectId: 'autohygro',
    authDomain: 'autohygro.firebaseapp.com',
    databaseURL: 'https://autohygro-default-rtdb.firebaseio.com',
    storageBucket: 'autohygro.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAOG6-1XWqqMev-I-0juWelQBqTmYhYfMg',
    appId: '1:1035799126686:android:3d08021d13fc95f39ad18f',
    messagingSenderId: '1035799126686',
    projectId: 'autohygro',
    databaseURL: 'https://autohygro-default-rtdb.firebaseio.com',
    storageBucket: 'autohygro.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDwdXSQcQ0sYksl_vBf9qIcLMR6-V6GWH0',
    appId: '1:1035799126686:ios:5f8fe67f4b8b5edc9ad18f',
    messagingSenderId: '1035799126686',
    projectId: 'autohygro',
    databaseURL: 'https://autohygro-default-rtdb.firebaseio.com',
    storageBucket: 'autohygro.firebasestorage.app',
    iosBundleId: 'com.example.autohygroApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDwdXSQcQ0sYksl_vBf9qIcLMR6-V6GWH0',
    appId: '1:1035799126686:ios:5f8fe67f4b8b5edc9ad18f',
    messagingSenderId: '1035799126686',
    projectId: 'autohygro',
    databaseURL: 'https://autohygro-default-rtdb.firebaseio.com',
    storageBucket: 'autohygro.firebasestorage.app',
    iosBundleId: 'com.example.autohygroApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMTad_MBUW7QCObXhqqp6PtQ_UDzR4izI',
    appId: '1:1035799126686:web:6030d6b0ff3c39009ad18f',
    messagingSenderId: '1035799126686',
    projectId: 'autohygro',
    authDomain: 'autohygro.firebaseapp.com',
    databaseURL: 'https://autohygro-default-rtdb.firebaseio.com',
    storageBucket: 'autohygro.firebasestorage.app',
  );
}
