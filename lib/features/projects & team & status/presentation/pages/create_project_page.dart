import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/project_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_and_team_bloc.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/create_project_form.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/routes/app_route_config.dart';
import '../../../../core/widgets/breadcrumbs/breadcumbs_item.dart';
import '../../../../core/widgets/buttons/icon-buttons/back_button.dart';
import '../../../../core/widgets/texts/page_title.dart';

class CreateProjectPage extends StatelessWidget {
  const CreateProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Breadcrumbs(
              paths: [AppRouteConfig.allProjects, AppRouteConfig.createProject],
              pages: ["All Project", "Create Project"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                const CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Create Project"),
              ],
            ),
            PaddingConfig.h24,
            BlocListener<ProjectAndTeamBloc, ProjectAndTeamState>(
              listener: (context, state) {
                ProjectBlocStateHandling().createProject(state, context);
              },
              listenWhen:
                  (previous, current) =>
                      previous.createProjectStatus !=
                      current.createProjectStatus,
              child: CreateProjectForm(),
            ),
          ],
        ),
      ),
    );
  }
}
