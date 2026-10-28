import 'package:flutter/material.dart';

void main() => runApp(const RegistrationApp());

class RegistrationApp extends StatelessWidget {
  const RegistrationApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Widgets Demo',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
        home: const RegistrationPage(),
      );
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void register() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    if (name.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your name and email.')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registration UI submitted for $name')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Registration'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.network(
                    'https://i.pravatar.cc/150?img=15',
                    height: 110, width: 110, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const CircleAvatar(
                      radius: 55, child: Icon(Icons.person, size: 55),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('Complete your profile'),
              ]),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(children: [
                Icon(Icons.school, size: 32, color: Colors.deepPurple),
                SizedBox(width: 12),
                Expanded(child: Text('Mobile Application Development',
                    style: TextStyle(fontWeight: FontWeight.bold))),
              ]),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name', prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address', prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: ElevatedButton.icon(
                onPressed: register,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Register'),
              )),
              const SizedBox(width: 12),
              Expanded(child: OutlinedButton.icon(
                onPressed: () {
                  nameController.clear();
                  emailController.clear();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
              )),
            ]),
            const SizedBox(height: 20),
            const Card(
              child: ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Widget demonstration'),
                subtitle: Text('This screen demonstrates Text, Container, Row, Column, Image, TextField, buttons and Scaffold.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
