import 'package:flutter/material.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project_details.dart';

void showProjectDetails(BuildContext context, ProjectEntity projectEntity) {
  showDialog(
    context: context,
    builder:
        (context) =>
            Dialog(child: ProjectDetails(projectEntity: projectEntity)),
  );
}
