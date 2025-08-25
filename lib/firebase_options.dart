// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  // Android Firebase config
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDJarN7VR8WjcFHYqgJFywoWi02BY6EEM',
    appId: '1:988277225188:android:9c9737d4d3d5fa53085ef1',
    messagingSenderId: '988277225188',
    projectId: 'eventatapp-8350c',
    storageBucket: 'eventatapp-8350c.appspot.com',
  );

  // iOS Firebase config
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA87hcAaAfe1S3W73X55wK8jfc7iBIFX74',
    appId: '1:988277225188:ios:05e864b38811e64f085ef1',
    messagingSenderId: '988277225188',
    projectId: 'eventatapp-8350c',
    storageBucket: 'eventatapp-8350c.appspot.com',
    iosClientId:
        '988277225188-64ekclj9mv11plibl5iub07rkveqqfnj.apps.googleusercontent.com',
    iosBundleId: 'com.amjad.eventNew',
  );
}
