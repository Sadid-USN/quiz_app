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
    apiKey: 'AIzaSyA8dBViby-b13rqs-0Y9VTzL6X41Tr0mnk',
    appId: '1:1098795874442:web:8ca1f9abe7e42e33fc1573',
    messagingSenderId: '1098795874442',
    projectId: 'quizapp-95cbd',
    authDomain: 'quizapp-95cbd.firebaseapp.com',
    storageBucket: 'quizapp-95cbd.appspot.com',
    measurementId: 'G-9P18EFJ1PC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDioEr3e1SywGzURK_TsOR6vbkorY4bJG0',
    appId: '1:1098795874442:android:7460656d2ef2efe2fc1573',
    messagingSenderId: '1098795874442',
    projectId: 'quizapp-95cbd',
    storageBucket: 'quizapp-95cbd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdbDDb3Gm8yds9LVTL7oeE9_j3CmU3hYc',
    appId: '1:1098795874442:ios:a9f704eb3a52f65bfc1573',
    messagingSenderId: '1098795874442',
    projectId: 'quizapp-95cbd',
    storageBucket: 'quizapp-95cbd.appspot.com',
    iosClientId: '1098795874442-jf84ig144mn3lsrk4r1abnm6iah2acfc.apps.googleusercontent.com',
    iosBundleId: 'com.darulasar.quizapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDdbDDb3Gm8yds9LVTL7oeE9_j3CmU3hYc',
    appId: '1:1098795874442:ios:a9f704eb3a52f65bfc1573',
    messagingSenderId: '1098795874442',
    projectId: 'quizapp-95cbd',
    storageBucket: 'quizapp-95cbd.appspot.com',
    iosClientId: '1098795874442-jf84ig144mn3lsrk4r1abnm6iah2acfc.apps.googleusercontent.com',
    iosBundleId: 'com.darulasar.quizapp',
  );
}
