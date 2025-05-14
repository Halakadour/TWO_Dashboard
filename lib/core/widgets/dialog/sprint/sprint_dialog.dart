import 'package:flutter/material.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/sprint_details.dart';

class SprintDialog {
  void showSprintDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(child: SprintDetails()),
    );
  }
}
