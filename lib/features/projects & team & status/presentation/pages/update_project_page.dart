import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/divider/custom_page_divider.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/update_project_form.dart';

class UpdateProjectPage extends StatelessWidget {
  const UpdateProjectPage({super.key});

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
                AppRouteConfig.updateProject,
              ],
              pages: ["All Project", "Project Details", "Update Project"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                const CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Update Project"),
              ],
            ),
            CustomPageDivider(),
            PaddingConfig.h24,
            UpdateProjectForm(
              projectEntity: ProjectEntity(
                id: 0,
                fullName: "fullName",
                companyName: "companyName",
                email: "email",
                phone: "phone",
                pType: ProjectType.maintain,
                projectDescription: "projectDescription",
                cost: "cost",
                duration: "duration",
                requirements: "requirements",
                document: "document",
                cType: CooperationType.analysis,
                contactTime: "contactTime",
                visibility: ProjectVisibility.private,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
