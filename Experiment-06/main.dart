import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProgressPage(),
    ));

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4FA),
      appBar: AppBar(
        title: const Text('Progress Hub', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Learning Summary', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text('A visual overview of study progress', style: TextStyle(color: Colors.grey.shade600)),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://picsum.photos/seed/study/700/250',
              height: 170, width: double.infinity, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 170, color: Colors.deepPurple.shade100,
                child: const Center(child: Icon(Icons.school, size: 70)),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text('Overview', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          const Row(children: [
            Expanded(child: _StatCard(icon: Icons.menu_book, title: 'Modules', value: '10')),
            SizedBox(width: 12),
            Expanded(child: _StatCard(icon: Icons.emoji_events, title: 'Badges', value: '06')),
          ]),
          const SizedBox(height: 12),
          const Row(children: [
            Expanded(child: _StatCard(icon: Icons.check_circle_outline, title: 'Completed', value: '22')),
            SizedBox(width: 12),
            Expanded(child: _StatCard(icon: Icons.local_fire_department, title: 'Streak', value: '12d')),
          ]),
          const SizedBox(height: 25),
          const Text('Weekly Study Hours', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Container(
            height: 240,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: BarChart(BarChartData(
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
                bottomTitles: AxisTitles(sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
                    final index = value.toInt();
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(index >= 0 && index < days.length ? days[index] : ''),
                    );
                  },
                )),
              ),
              barGroups: [
                _bar(0, 2.5), _bar(1, 3.5), _bar(2, 2.0),
                _bar(3, 4.5), _bar(4, 3.0), _bar(5, 5.5), _bar(6, 4.0),
              ],
            )),
          ),
          const SizedBox(height: 20),
          const Card(child: ListTile(
            leading: Icon(Icons.lightbulb, color: Colors.orange, size: 32),
            title: Text('Keep up the pace!'),
            subtitle: Text('Use charts to understand activity at a glance.'),
          )),
        ]),
      ),
    );
  }

  static BarChartGroupData _bar(int x, double y) => BarChartGroupData(
        x: x,
        barRods: [BarChartRodData(toY: y, color: Colors.deepPurple, width: 16, borderRadius: BorderRadius.circular(6))],
      );
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  const _StatCard({required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Row(children: [
          Icon(icon, size: 30, color: Colors.deepPurple),
          const SizedBox(width: 8),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(color: Colors.grey.shade600)),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ])),
        ]),
      );
}
