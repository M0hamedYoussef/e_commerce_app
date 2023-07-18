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
    apiKey: 'my_apikey',
    appId: '1:636982464062:web:cf2aa8c39343290a464b6f',
    messagingSenderId: '636982464062',
    projectId: 'e-commerce-94e01',
    authDomain: 'e-commerce-94e01.firebaseapp.com',
    storageBucket: 'e-commerce-94e01.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'my_apikey',
    appId: '1:636982464062:android:73e6a161d6cf885a464b6f',
    messagingSenderId: '636982464062',
    projectId: 'e-commerce-94e01',
    storageBucket: 'e-commerce-94e01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'my_apikey',
    appId: '1:636982464062:ios:8275a609c94ac26f464b6f',
    messagingSenderId: '636982464062',
    projectId: 'e-commerce-94e01',
    storageBucket: 'e-commerce-94e01.appspot.com',
    androidClientId: '636982464062-uhvgs7621nls95mggfcvp9jhcn7edsq6.apps.googleusercontent.com',
    iosClientId: '636982464062-dl0ss7smdk9cbqdar34ekvt0ubja6tt0.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'my_apikey',
    appId: '1:636982464062:ios:8275a609c94ac26f464b6f',
    messagingSenderId: '636982464062',
    projectId: 'e-commerce-94e01',
    storageBucket: 'e-commerce-94e01.appspot.com',
    androidClientId: '636982464062-uhvgs7621nls95mggfcvp9jhcn7edsq6.apps.googleusercontent.com',
    iosClientId: '636982464062-dl0ss7smdk9cbqdar34ekvt0ubja6tt0.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerce',
  );
}
