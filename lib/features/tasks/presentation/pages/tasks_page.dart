import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Text("Tasks page"),
    );
  }
}
