// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.home.page : 1.0.0

// # [ config ]

// # - : ./pubspec.yaml
// dependencies:
// flutter:
//   sdk: flutter
// shared_preferences: ^2.0.15

// # - : ./android/app/src/main/AndroidManifest.xml
// <uses-permission android:name="android.permission.CAMERA" />

// # [ run ]
// # - : flutter pub get

// # [ flutter ]
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Page'),
    );
  }
}
