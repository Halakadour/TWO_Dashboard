import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [Expanded(child: _buildMainContent())]),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Calendar',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(backgroundImage: AssetImage('assets/image.png')),
            ],
          ),
          const SizedBox(height: 16),
          _buildSummaryRow(),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 4, child: _buildTimeGrid()),
                const SizedBox(width: 16),
                _buildRightCalendarPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow() {
    return Row(
      children: [
        _buildSummaryTile('Total All Schedule', '16'),
        _buildSummaryTile('Total Product Schedule', '4'),
        _buildSummaryTile('Total Project Schedule', '5'),
        _buildSummaryTile('Total Team Schedule', '8'),
      ],
    );
  }

  Widget _buildSummaryTile(String label, String value) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildTimeGrid() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildCategoryChip('Product', Colors.blue),
              const SizedBox(width: 8),
              _buildCategoryChip('Project', Colors.orange),
              const SizedBox(width: 8),
              _buildCategoryChip('Team', Colors.yellow.shade700),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) {
                final hour = 9 + index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          '$hour:00',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            if (hour == 9)
                              _buildEventCard(
                                'Development Sprint Planning',
                                Colors.orange,
                              ),
                            if (hour == 10)
                              _buildEventCard(
                                'Project Kickoff Meeting',
                                Colors.blue,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(String title, Color color) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      padding: EdgeInsets.all(8),
      width: 180,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 10, backgroundColor: color),
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color, radius: 4),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
    );
  }

  Widget _buildRightCalendarPanel() {
    return Container(
      width: 260,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2028, 9, 1),
            lastDay: DateTime.utc(2028, 10, 31),
            focusedDay: DateTime.utc(2028, 9, 13),
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            calendarStyle: CalendarStyle(outsideDaysVisible: false),
          ),
          const SizedBox(height: 12),
          Text(
            'Development Sprint Planning',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text('Category: Project'),
          Text('Date: September 13, 2028'),
          Text('Time: 9:00 AM - 10:00 AM'),
          Text('Location: Via Zoom'),
          Text('Team: 👤👤'),
          const SizedBox(height: 8),
          Text(
            'The Development Sprint Planning meeting is scheduled to outline the tasks and objectives for the upcoming sprint. This session will focus on reviewing the backlog, prioritizing tasks, and assigning responsibilities to ensure the team meets the sprint goals effectively.',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
