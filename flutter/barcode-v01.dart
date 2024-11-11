// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.barcode.v01 : 1.0.0

// # [ config ]

// # - : ./pubspec.yaml
// dependencies:
// flutter:
//   sdk: flutter
// barcode_scan2: ^4.0.0

// # - : ./android/app/src/main/AndroidManifest.xml
// <uses-permission android:name="android.permission.CAMERA" />

// # [ run ]
// # - : flutter pub get

// # [ flutter ]
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodeScannerPage(),
    );
  }
}

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String barcode = "";

  Future<void> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      setState(() {
        barcode = result.rawContent; // The scanned barcode content
      });
    } catch (e) {
      setState(() {
        barcode = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Scanned Barcode:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              barcode,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scan Barcode'),
            ),
          ],
        ),
      ),
    );
  }
}
