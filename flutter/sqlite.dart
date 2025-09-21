// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.login : 25.8.25.1

// # [ flutter ] : pubspec.yaml
 /*
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.3.2 # Android
  sqflite_common_ffi: ^2.3.1 # Windows
  path: ^1.8.3
// */

// # [ flutter ] : main.dart
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Database database;
  List<Map<String, dynamic>> items = [];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _openDatabase();
  }

  Future<void> _openDatabase() async {
    // Caminho do banco
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'my_database.db');

    // Abrir/criar banco
    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Criar tabela
        await db.execute('''
          CREATE TABLE items (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT
          )
        ''');
      },
    );

    _refreshItems();
  }

  Future<void> _refreshItems() async {
    final data = await database.query('items');
    setState(() {
      items = data;
    });
  }

  Future<void> _addItem(String name) async {
    await database.insert('items', {'name': name});
    _refreshItems();
  }

  Future<void> _deleteItem(int id) async {
    await database.delete('items', where: 'id = ?', whereArgs: [id]);
    _refreshItems();
  }

  @override
  void dispose() {
    controller.dispose();
    database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Novo item',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isNotEmpty) {
                  _addItem(text);
                  controller.clear();
                }
              },
              child: const Text('Adicionar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    title: Text(item['name']),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _deleteItem(item['id']);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
