import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/project/loading_project_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/project/project_table.dart';
import 'package:two_dashboard/core/widgets/dialog/status/error_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/not_authorized_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/bloc/project_and_team_bloc.dart';

class ProjectBlocStateHandling {
  // Create Project
  void createProject(ProjectAndTeamState state, BuildContext context) {
    if (state.createProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createProjectStatus == CasualStatus.success) {
      context.pop();
      context.read<ProjectAndTeamBloc>().add(ShowAllProjectsEvent());
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.projects);
        context.pop();
      });
    } else if (state.createProjectStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.createProjectStatus == CasualStatus.notAuthorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }

  // Get All Project Table
  Widget getProjectTable(ProjectAndTeamState state) {
    if (state.allProjectsListStatus == CasualStatus.loading) {
      return const LoadingProjectTable();
    } else if (state.allProjectsListStatus == CasualStatus.success) {
      return ProjectTable(projectList: state.allProjectsList);
    } else if (state.allProjectsListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }
}
