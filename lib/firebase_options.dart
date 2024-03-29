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
    apiKey: 'AIzaSyB4ppRfO_2N6BZQCnei1jmLjve6gi7pqfo',
    appId: '1:937139461893:web:92a2af53fb98ac6e44a16c',
    messagingSenderId: '937139461893',
    projectId: 'storeapp-4a0c4',
    authDomain: 'storeapp-4a0c4.firebaseapp.com',
    storageBucket: 'storeapp-4a0c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHZKExmlxIJ0itXvI8fUWF3gwg0NkVXXY',
    appId: '1:937139461893:android:37373c39f9b2186944a16c',
    messagingSenderId: '937139461893',
    projectId: 'storeapp-4a0c4',
    storageBucket: 'storeapp-4a0c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdG6JpF2hPykbaKrWAWQnAMXT7L8Etz88',
    appId: '1:937139461893:ios:52591f4c7309dbe544a16c',
    messagingSenderId: '937139461893',
    projectId: 'storeapp-4a0c4',
    storageBucket: 'storeapp-4a0c4.appspot.com',
    iosClientId: '937139461893-q70fhjuclb4t0ng2fotajufihq1ac6m5.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdG6JpF2hPykbaKrWAWQnAMXT7L8Etz88',
    appId: '1:937139461893:ios:b73a6a2c10e7190e44a16c',
    messagingSenderId: '937139461893',
    projectId: 'storeapp-4a0c4',
    storageBucket: 'storeapp-4a0c4.appspot.com',
    iosClientId: '937139461893-muu0kshfoj8bbf6ccfodenb3vckcjv50.apps.googleusercontent.com',
    iosBundleId: 'com.example.storeApp.RunnerTests',
  );
}
