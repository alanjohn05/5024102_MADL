import 'package:flutter/material.dart';

void main() => runApp(const NavigationGestureApp());

class NavigationGestureApp extends StatelessWidget {
  const NavigationGestureApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
          '/courses': (_) => const DetailPage(title: 'My Courses', icon: Icons.menu_book),
          '/profile': (_) => const DetailPage(title: 'My Profile', icon: Icons.account_circle),
          '/settings': (_) => const DetailPage(title: 'Settings', icon: Icons.settings),
        },
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(title: const Text('Student Dashboard'), centerTitle: true,
        backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Hello, Student!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text('Where would you like to go?', style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 25),
          _navigationCard(context, Icons.menu_book, 'My Courses', '/courses'),
          _navigationCard(context, Icons.account_circle, 'My Profile', '/profile'),
          _navigationCard(context, Icons.settings, 'Settings', '/settings'),
          const Spacer(),
          Center(
            child: GestureDetector(
              onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('You found the secret!')),
              ),
              child: const Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.favorite, size: 50, color: Colors.indigo),
                SizedBox(height: 8),
                Text('Long press me'),
              ]),
            ),
          ),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }

  Widget _navigationCard(BuildContext context, IconData icon, String label, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)]),
        child: Row(children: [
          Icon(icon, size: 35, color: Colors.indigo),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          const Icon(Icons.arrow_forward_ios, size: 18),
        ]),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  const DetailPage({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
        body: Center(
          child: GestureDetector(
            onDoubleTap: () => Navigator.pop(context),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(icon, size: 80, color: Colors.indigo),
              const SizedBox(height: 15),
              Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Double tap to go back'),
            ]),
          ),
        ),
      );
}
