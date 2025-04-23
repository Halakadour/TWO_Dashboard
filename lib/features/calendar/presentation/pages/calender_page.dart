import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Text("Calender Page"),
    );
  }
}
