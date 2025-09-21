// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.simple : 25.9.21.1

// # [ pubspec ]
/*
dependencies:
  cupertino_icons: ^1.0.8
  window_manager: ^0.3.9
*/

// # [ flutter ]
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

const String C_TITLE = 'ZRFISAAC';
const Size C_WINDOW_SIZE = Size(400, 800);

// # : - project
void main() async {
  // # : - windows
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: C_WINDOW_SIZE,
      center: true,
      backgroundColor: Colors.transparent,
      title: C_TITLE,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // # : - start
  runApp(const Main());
}

// # : - main
class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: C_TITLE,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const PageHome(title: C_TITLE),
      debugShowCheckedModeBanner: false,
    );
  }
}

// # : - page_home
class PageHome extends StatefulWidget {
  const PageHome({super.key, required this.title});
  final String title;
  @override
  State<PageHome> createState() => PageHomeState();
}

// # : - page_home : State
class PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
