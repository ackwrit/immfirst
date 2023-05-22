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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDILybZsRQiJi0nh7lHRjS9ZewNyNwnRE8',
    appId: '1:210310663332:android:80407f76799530361daa31',
    messagingSenderId: '210310663332',
    projectId: 'firstimm',
    storageBucket: 'firstimm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLb7vHL39WT-hx73sMwYkagC2YGpVd2FM',
    appId: '1:210310663332:ios:05a6cda17437902c1daa31',
    messagingSenderId: '210310663332',
    projectId: 'firstimm',
    storageBucket: 'firstimm.appspot.com',
    iosClientId: '210310663332-r9r21uqepprt365fjbopio52ma3dgmjq.apps.googleusercontent.com',
    iosBundleId: 'com.firstsfjh.app.firstapplicationimmm',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLb7vHL39WT-hx73sMwYkagC2YGpVd2FM',
    appId: '1:210310663332:ios:05a6cda17437902c1daa31',
    messagingSenderId: '210310663332',
    projectId: 'firstimm',
    storageBucket: 'firstimm.appspot.com',
    iosClientId: '210310663332-r9r21uqepprt365fjbopio52ma3dgmjq.apps.googleusercontent.com',
    iosBundleId: 'com.firstsfjh.app.firstapplicationimmm',
  );
}
