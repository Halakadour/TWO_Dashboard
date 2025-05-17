import 'package:flutter/material.dart';
import 'package:two_dashboard/features/projects%20&%20Team/presentation/widgets/project_details.dart';

class SprintDialog {
  void showSprintDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: ProjectDetails()),
    );
  }
}
