import 'package:flutter/material.dart';

void main() => runApp(const HelloWorldApp());

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello World',
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const HelloWorldScreen(),
    );
  }
}

class HelloWorldScreen extends StatefulWidget {
  const HelloWorldScreen({super.key});

  @override
  State<HelloWorldScreen> createState() => _HelloWorldScreenState();
}

class _HelloWorldScreenState extends State<HelloWorldScreen> {
  String message = 'Tap the button below';

  void showGreeting() {
    setState(() => message = 'Hello World! Flutter says Hi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello World App'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_emotions_outlined, size: 70, color: Colors.teal),
              const SizedBox(height: 20),
              Text(message, textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: showGreeting,
                child: const Text('Say Hello'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
