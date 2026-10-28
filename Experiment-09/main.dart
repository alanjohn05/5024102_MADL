import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Replace these with your Supabase Project URL and publishable/anon key.
// Never put a service_role key in a client application.
const supabaseUrl = 'https://YOUR_PROJECT_REF.supabase.co';
const supabaseKey = 'YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY';

void main() => runApp(const StudentDatabaseApp());

class StudentDatabaseApp extends StatelessWidget {
  const StudentDatabaseApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
        home: const StudentPage(),
      );
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final courseController = TextEditingController();

  String status = 'Enter student details';
  String records = '';
  bool busy = false;

  Uri get studentsUri => Uri.parse('$supabaseUrl/rest/v1/students');

  Map<String, String> get headers => {
        'apikey': supabaseKey,
        'Authorization': 'Bearer $supabaseKey',
        'Content-Type': 'application/json',
      };

  bool get configured =>
      !supabaseUrl.contains('YOUR_PROJECT_REF') &&
      !supabaseKey.contains('YOUR_SUPABASE');

  Future<void> runOperation(Future<void> Function() operation) async {
    if (!configured) {
      setState(() => status = 'Add your Supabase URL and publishable/anon key in main.dart.');
      return;
    }
    setState(() {
      busy = true;
      status = 'Working...';
    });
    try {
      await operation();
    } catch (error) {
      if (mounted) setState(() => status = 'Error: $error');
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  Future<void> saveStudent() => runOperation(() async {
        final id = int.tryParse(idController.text.trim());
        final name = nameController.text.trim();
        final course = courseController.text.trim();
        if (id == null || name.isEmpty || course.isEmpty) {
          setState(() => status = 'Enter a numeric ID, student name and course.');
          return;
        }
        final response = await http.post(
          studentsUri,
          headers: {...headers, 'Prefer': 'return=representation'},
          body: jsonEncode({'id': id, 'name': name, 'course': course}),
        );
        if (response.statusCode < 200 || response.statusCode >= 300) {
          throw Exception('Save failed (${response.statusCode}): ${response.body}');
        }
        setState(() => status = 'Student saved successfully. ${response.body}');
      });

  Future<void> readStudents() => runOperation(() async {
        final response = await http.get(
          studentsUri.replace(queryParameters: {'select': '*', 'order': 'id.asc'}),
          headers: headers,
        );
        if (response.statusCode < 200 || response.statusCode >= 300) {
          throw Exception('Read failed (${response.statusCode}): ${response.body}');
        }
        final decoded = jsonDecode(response.body);
        setState(() {
          records = const JsonEncoder.withIndent('  ').convert(decoded);
          status = 'Records loaded successfully.';
        });
      });

  Future<void> deleteStudent() => runOperation(() async {
        final id = int.tryParse(idController.text.trim());
        if (id == null) {
          setState(() => status = 'Enter a valid Student ID to delete.');
          return;
        }
        final response = await http.delete(
          studentsUri.replace(queryParameters: {'id': 'eq.$id'}),
          headers: {...headers, 'Prefer': 'return=representation'},
        );
        if (response.statusCode < 200 || response.statusCode >= 300) {
          throw Exception('Delete failed (${response.statusCode}): ${response.body}');
        }
        setState(() => status = 'Delete request completed for student ID $id.');
      });

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    courseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Student Database')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Text('Supabase CRUD Demo', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextField(
              controller: idController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Student ID', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Student Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(labelText: 'Course', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            Wrap(spacing: 10, runSpacing: 8, alignment: WrapAlignment.center, children: [
              ElevatedButton(onPressed: busy ? null : saveStudent, child: const Text('SAVE')),
              ElevatedButton(onPressed: busy ? null : readStudents, child: const Text('READ')),
              OutlinedButton(onPressed: busy ? null : deleteStudent, child: const Text('DELETE')),
            ]),
            if (busy) const Padding(padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator())),
            const SizedBox(height: 12),
            Text(status),
            if (records.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text('Student records', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10)),
                child: SelectableText(records, style: const TextStyle(fontFamily: 'monospace')),
              ),
            ],
          ]),
        ),
      );
}
