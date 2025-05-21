import 'package:flutter/material.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/widgets/project_details.dart';

class SprintDialog {
  void showSprintDetails(BuildContext context, ProjectEntity projectEntity) {
    showDialog(
      context: context,
      builder:
          (context) =>
              Dialog(child: ProjectDetails(projectEntity: projectEntity)),
    );
  }
}
