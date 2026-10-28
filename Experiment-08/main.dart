import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(const FileManagerApp());

class FileManagerApp extends StatelessWidget {
  const FileManagerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'File Manager',
        theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
        home: const FilePage(),
      );
}

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  static const empty = 'No file created yet';
  String fileContent = empty;
  String displayText = empty;

  void saveFile() {
    final data = {
      'name': 'Alan',
      'course': 'Mobile Application Development Lab',
      'status': 'Saved successfully',
    };
    setState(() {
      fileContent = jsonEncode(data);
      displayText = fileContent;
    });
  }

  void readFile() {
    setState(() {
      if (fileContent == empty) {
        displayText = 'File not found';
      } else {
        final data = jsonDecode(fileContent) as Map<String, dynamic>;
        displayText = 'Status: ${data['status']}';
      }
    });
  }

  void deleteFile() {
    setState(() {
      fileContent = empty;
      displayText = empty;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        appBar: AppBar(title: const Text('File Manager'), centerTitle: true,
          backgroundColor: Colors.indigo, foregroundColor: Colors.white),
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.folder, size: 70, color: Colors.indigo),
                const SizedBox(height: 15),
                const Text('My File', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                SelectableText(displayText, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                ElevatedButton.icon(onPressed: saveFile, icon: const Icon(Icons.save), label: const Text('Save')),
                const SizedBox(height: 10),
                OutlinedButton.icon(onPressed: readFile, icon: const Icon(Icons.file_open), label: const Text('Read')),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: deleteFile, icon: const Icon(Icons.delete_outline), label: const Text('Delete'),
                  style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                ),
                const SizedBox(height: 12),
                const Text('Demo note: this stores JSON in memory, not on the device disk.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
              ]),
            ),
          ),
        ),
      );
}
