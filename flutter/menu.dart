// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.menu : 25.9.21.1

// # [ pubspec ]
/*
dependencies:
  cupertino_icons: ^1.0.8
  window_manager: ^0.3.9
*/

// # [ flutter ]
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

const String cEmail = 'zrfisaac@gmail.com';
const String cName = 'Isaac Caires Santana';
const String cTitle = 'ZRFISAAC';
const Size cWindowSize = Size(400, 800);

// # : - project
void main() async {
  // # : - windows
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: cWindowSize,
      center: true,
      backgroundColor: Colors.transparent,
      title: cTitle,
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
      title: cTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const PageHome(title: cTitle),
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
      drawer: const PageHomeMenu(),
    );
  }
}

// # : - page_home : Menu
class PageHomeMenu extends StatelessWidget {
  const PageHomeMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 30, color: Colors.indigo),
                ),
                SizedBox(height: 10),
                Text(
                  cName,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  cEmail,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          )
          ,
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.close),
            title: const Text('Close'),
            onTap: () {
              Navigator.pop(context);
              SystemNavigator.pop();
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
