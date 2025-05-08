import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProjectTimelinePage extends StatelessWidget {
  const ProjectTimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Row(children: [Expanded(child: _buildTimelineContent())]),
    );
  }

  Widget _buildTimelineContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Project Timeline',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(backgroundImage: AssetImage('assets/image.png')),
            ],
          ),
          const SizedBox(height: 16),
          _buildTimelineCalendar(),
          const SizedBox(height: 16),
          Expanded(child: _buildTimelineRows()),
        ],
      ),
    );
  }

  Widget _buildTimelineCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2028, 9, 1),
      lastDay: DateTime.utc(2028, 10, 31),
      focusedDay: DateTime.utc(2028, 9, 25),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        markersAlignment: Alignment.bottomCenter,
      ),
      daysOfWeekHeight: 24,
      headerStyle: HeaderStyle(titleCentered: true, formatButtonVisible: false),
    );
  }

  Widget _buildTimelineRows() {
    return ListView(
      children: [
        _buildTimelineCard(
          'Event Masters Event Branding & Coordination',
          '25-30 September, 2028',
          'Graphics',
          'Completed',
          Colors.blue.shade100,
        ),
        _buildTimelineCard(
          'Enterprise Solutions Custom CRM UI/UX Design',
          '2-7 October, 2028',
          'UI Kits',
          'In Progress',
          Colors.yellow.shade300,
        ),
        _buildTimelineCard(
          'Medixia Website Design',
          '28 September - 1 October, 2028',
          'Mockups',
          'Upcoming',
          Colors.orange.shade100,
        ),
        // More cards...
      ],
    );
  }

  Widget _buildTimelineCard(
    String title,
    String date,
    String category,
    String status,
    Color bgColor,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(date),
          Text(category),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
