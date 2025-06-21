// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.flutter.login : 25.6.12.1

// # [ flutter ] : main dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login + Menu Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

// Tela de login
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();

  void _login() {
    final name = _controller.text.trim();
    if (name.isNotEmpty) {
      // Navega para MainPage passando o nome do usuário
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MainPage(userName: name),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, insira seu nome')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página de Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Digite seu nome para entrar:'),
            TextField(controller: _controller),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text('Entrar')),
          ],
        ),
      ),
    );
  }
}

// Página principal com menu lateral
class MainPage extends StatefulWidget {
  final String userName;

  const MainPage({super.key, required this.userName});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, ${widget.userName}!'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Página Principal'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o menu
              },
            ),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('Página Secundária'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o menu
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SecondaryPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () {
                Navigator.of(context).pop(); // Fecha o menu
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Esta é a página principal, ${widget.userName}.',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Página secundária
class SecondaryPage extends StatelessWidget {
  const SecondaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Página Secundária')),
      body: const Center(child: Text('Conteúdo da página secundária')),
    );
  }
}
