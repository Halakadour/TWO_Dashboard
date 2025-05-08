import 'package:flutter/material.dart';
import 'package:two_dashboard/features/tasks/presentation/widgets/task_details.dart';

class TaskDialog {
  void showTaskDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: TaskDetails()),
    );
  }
}
