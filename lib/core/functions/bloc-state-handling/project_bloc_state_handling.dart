import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/project/loading_pended_project_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/project/pended_project_table.dart';
import 'package:two_dashboard/core/widgets/dialog/status/error_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/not_authorized_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_and_team_bloc.dart';

class ProjectBlocStateHandling {
  // Create Project
  void createProject(ProjectAndTeamState state, BuildContext context) {
    if (state.createProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createProjectStatus == CasualStatus.success) {
      context.pop();
      context.read<ProjectAndTeamBloc>().add(ShowAllProjectsEvent());
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.allProjects);
        context.pop();
      });
    } else if (state.createProjectStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.createProjectStatus == CasualStatus.not_authorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }

  // Get All Projects Table
  Widget getAllProjectsTable(ProjectAndTeamState state) {
    if (state.allProjectsListStatus == CasualStatus.loading) {
      return const LoadingPendedProjectTable();
    } else if (state.allProjectsListStatus == CasualStatus.success) {
      return PendedProjectTable(projectList: state.allProjectsList);
    } else if (state.allProjectsListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // Get Pended Projects Table
  Widget getPendedProjectsTable(ProjectAndTeamState state) {
    if (state.pendedProjectListStatus == CasualStatus.loading) {
      return const LoadingPendedProjectTable();
    } else if (state.pendedProjectListStatus == CasualStatus.success) {
      return PendedProjectTable(projectList: state.pendedProjectList);
    } else if (state.pendedProjectListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // Sent Edit Project Message
  void sentEditProjectMessage(ProjectAndTeamState state, BuildContext context) {
    if (state.editRequestProjectStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.editRequestProjectStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.editRequestProjectStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.editRequestProjectStatus == CasualStatus.not_authorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }
}
