import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/divider/custom_page_divider.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/update_task_form.dart';

class UpdateTaskPage extends StatelessWidget {
  const UpdateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Breadcrumbs(
              paths: [
                AppRouteConfig.allProjects,
                AppRouteConfig.projectDetails,
                AppRouteConfig.taskDetails,
                AppRouteConfig.updateTask,
              ],
              pages: [
                "All Project",
                "Project Details",
                "Task Details",
                "Update Task",
              ],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                const CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Update Task"),
              ],
            ),
            CustomPageDivider(),
            PaddingConfig.h24,
            UpdateTaskForm(
              taskEntity: TaskEntity(
                id: 0,
                title: "title",
                description: "description",
                taskStatus: TaskStatus.toDo,
                assignedTo: "2",
                tPriority: TaskPriority.high,
                tCompletion: 55,
                startDate: DateTime.now(),
                endDate: DateTime.now(),
              ),
              team: Team(
                id: 0,
                name: 'Mobile Team',
                members: [
                  Member(
                    id: 0,
                    name: "Hala Kad",
                    email: "email",
                    isManager: true,
                  ),
                  Member(
                    id: 1,
                    name: "Laile",
                    email: "email",
                    isManager: false,
                  ),
                  Member(
                    id: 2,
                    name: "Lilian",
                    email: "email",
                    isManager: false,
                  ),
                  Member(id: 0, name: "Ruha", email: "email", isManager: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
