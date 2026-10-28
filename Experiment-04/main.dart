import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    ));

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        title: const Text('Registration Portal'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text('Please fill in your details below', style: TextStyle(color: Colors.grey.shade600)),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: LinearGradient(colors: [Colors.teal.shade700, Colors.teal.shade300]),
                ),
                child: const Row(children: [
                  CircleAvatar(radius: 30, backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.teal, size: 36)),
                  SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('New User Account', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('Complete the form to register', style: TextStyle(color: Colors.white70)),
                  ])),
                ]),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline), border: OutlineInputBorder()),
                validator: (value) => value == null || value.trim().isEmpty ? 'Enter your full name' : null,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email Address', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder()),
                validator: (value) {
                  final email = value?.trim() ?? '';
                  if (email.isEmpty) return 'Enter your email';
                  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) return 'Enter a valid email address';
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone_outlined), border: OutlineInputBorder()),
                validator: (value) {
                  final phone = value?.trim() ?? '';
                  if (phone.isEmpty) return 'Enter your phone number';
                  if (!RegExp(r'^\d{10}$').hasMatch(phone)) return 'Enter a valid 10-digit number';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              Row(children: [
                Expanded(child: ElevatedButton.icon(
                  onPressed: submitForm,
                  icon: const Icon(Icons.check),
                  label: const Text('Submit'),
                )),
                const SizedBox(width: 12),
                Expanded(child: OutlinedButton.icon(
                  onPressed: () {
                    formKey.currentState!.reset();
                    nameController.clear();
                    emailController.clear();
                    phoneController.clear();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
