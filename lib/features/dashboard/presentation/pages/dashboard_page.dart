import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/theme/color.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: const [
                        TaskSummaryCard(),
                        CalendarCard(),
                        TaskActivityGraph(),
                        TaskCategoryBarChart(),
                        TimeTrackerSection(),
                        MyTasksSection(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TaskSummaryCard extends StatelessWidget {
  const TaskSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _summaryBox('Upcoming', '32', Colors.pink.shade100, Iconsax.layer),
        const SizedBox(width: 12),
        _summaryBox(
          'In Progress',
          '64',
          Colors.blue.shade100,
          Iconsax.status_up,
        ),
        const SizedBox(width: 12),
        _summaryBox(
          'Completed',
          '105',
          Colors.amber.shade100,
          Iconsax.tick_square,
        ),
      ],
    );
  }

  Widget _summaryBox(String label, String count, Color color, IconData icon) {
    return Container(
      width: 150,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28),
          const Spacer(),
          Text(
            count,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
}

class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'November 2028',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 12),
          Expanded(child: Center(child: Text('Calendar View Placeholder'))),
        ],
      ),
    );
  }
}

class TaskActivityGraph extends StatelessWidget {
  const TaskActivityGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(show: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: const [
                FlSpot(0, 10),
                FlSpot(1, 14),
                FlSpot(2, 8),
                FlSpot(3, 16),
                FlSpot(4, 12),
                FlSpot(5, 17),
                FlSpot(6, 15),
              ],
              dotData: FlDotData(show: false),
              color: AppColors.grayShade2,
              barWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCategoryBarChart extends StatelessWidget {
  const TaskCategoryBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [BarChartRodData(toY: 200, color: Colors.orange)],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [BarChartRodData(toY: 160, color: Colors.blue)],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [BarChartRodData(toY: 180, color: Colors.purple)],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeTrackerSection extends StatelessWidget {
  const TimeTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: BarChart(
        BarChartData(
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(6, (index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(toY: (index + 1) * 50.0, color: Colors.teal),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class MyTasksSection extends StatelessWidget {
  const MyTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Tasks',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Task list will be shown here.'),
        ],
      ),
    );
  }
}
