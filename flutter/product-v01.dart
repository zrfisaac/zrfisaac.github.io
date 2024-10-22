// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.product.v01 : 1.0.0

// # [ config ]

// # - : ./pubspec.yaml
// dependencies:
// flutter:
//   sdk: flutter
// barcode_scan2: ^4.0.0
// sqflite: ^2.0.0+4
// path: ^1.8.0

// # - : ./android/app/src/main/AndroidManifest.xml
// <uses-permission android:name="android.permission.CAMERA" />

// # [ run ]
// # - : flutter pub get

// # [ flutter ]
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p; // Use alias for path package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingListPage(),
    );
  }
}

class ShoppingListPage extends StatefulWidget {
  @override
  _ShoppingListPageState createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> products = [];
  double total = 0;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    products = await dbHelper.getProducts();
    setState(() {
      total = products.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
    });
  }

  Future<void> _addProduct(String name, String barcode, double price) async {
    await dbHelper.insertProduct(name, barcode, price);
    _loadProducts();
  }

  Future<void> _scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      final existingProduct = products.firstWhere(
        (product) => product['barcode'] == result.rawContent,
        orElse: () => {},
      );

      if (existingProduct.isNotEmpty) {
        int id = existingProduct['id'];
        int quantity = existingProduct['quantity'] + 1;
        await dbHelper.updateProductQuantity(id, quantity);
      } else {
        _showAddProductDialog(result.rawContent);
      }
      _loadProducts();
    } catch (e) {
      print('Error: $e');
    }
  }

  void _showAddProductDialog(String scannedBarcode) {
    TextEditingController nameController = TextEditingController(text: '');
    TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Product Price'),
              ),
              TextField(
                enabled: false,
                decoration: InputDecoration(labelText: 'Barcode'),
                controller: TextEditingController(text: scannedBarcode),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                double price = double.tryParse(priceController.text) ?? 0.0;
                _addProduct(nameController.text, scannedBarcode, price);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showProductDetails(Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product['name']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Price: \$${product['price'].toStringAsFixed(2)}'),
              Text('Quantity: ${product['quantity']}'),
              Text('Total: \$${(product['price'] * product['quantity']).toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _showEditProductDialog(product);
                Navigator.of(context).pop();
              },
              child: Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                dbHelper.deleteProduct(product['id']);
                _loadProducts();
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showEditProductDialog(Map<String, dynamic> product) {
    TextEditingController quantityController = TextEditingController(text: product['quantity'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Quantity'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int newQuantity = int.tryParse(quantityController.text) ?? 1;
                dbHelper.updateProductQuantity(product['id'], newQuantity);
                _loadProducts();
                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(child: Text('Total: \$${total.toStringAsFixed(2)}')),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product['name']),
            subtitle: Text('Price: \$${product['price'].toStringAsFixed(2)} - Count: ${product['quantity']}'),
            onTap: () => _showProductDetails(product),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _scanBarcode(),
            tooltip: 'Scan Barcode',
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              _showAddProductDialog('');
            },
            tooltip: 'Add Product',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

// SQLite Database Helper Class (Embedded in the same file)
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = p.join(await getDatabasesPath(), 'shopping_list.db'); // Use alias for join function
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, barcode TEXT, price REAL, quantity INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertProduct(String name, String barcode, double price) async {
    final db = await database;
    await db.insert(
      'products',
      {'name': name, 'barcode': barcode, 'price': price, 'quantity': 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('products');
  }

  Future<void> updateProductQuantity(int id, int quantity) async {
    final db = await database;
    await db.update(
      'products',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete(
      'products',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
