import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WorkspacePage(),
    ));

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF7F5),
      appBar: AppBar(
        title: const Text('My Workspace', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade900,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hi, Student!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text("Here's what's happening today", style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.deepOrange.shade700, Colors.deepOrange.shade300]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(children: [
                CircleAvatar(radius: 32, backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 38, color: Colors.deepOrange)),
                SizedBox(width: 15),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Student Profile', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Mobile App Development', style: TextStyle(color: Colors.white70)),
                ])),
              ]),
            ),
            const SizedBox(height: 25),
            const Text('Quick Access', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.3,
              children: const [
                _DashboardTile(icon: Icons.note_alt_outlined, label: 'Notes'),
                _DashboardTile(icon: Icons.calendar_today_outlined, label: 'Calendar'),
                _DashboardTile(icon: Icons.chat_bubble_outline, label: 'Messages'),
                _DashboardTile(icon: Icons.settings_outlined, label: 'Settings'),
              ],
            ),
            const SizedBox(height: 25),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Row(children: [
                  Icon(Icons.lightbulb, size: 32, color: Colors.orange),
                  SizedBox(width: 15),
                  Expanded(child: Text('Use Row, Column, Container, GridView and Expanded to build clean, responsive dashboards.')),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const _DashboardTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [BoxShadow(blurRadius: 8, color: Colors.black12)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.deepOrange.shade700),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );
}
