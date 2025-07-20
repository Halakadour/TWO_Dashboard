import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/divider/custom_page_divider.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/update_sprint_form.dart';

class UpdateSprintPage extends StatelessWidget {
  const UpdateSprintPage({super.key});

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
                AppRouteConfig.sprintDetails,
                AppRouteConfig.updateSprint,
              ],
              pages: [
                "All Project",
                "Project Details",
                "Sprint Details",
                "Update Sprint",
              ],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                const CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Update Sprint"),
              ],
            ),
            CustomPageDivider(),
            PaddingConfig.h24,
            UpdateSprintForm(
              sprintEntity: SprintEntity(
                id: 0,
                label: "label",
                description: "description",
                goal: "goal",
                start: DateTime.now(),
                end: DateTime.now(),
                sprintStatus: "sprintStatus",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
