import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/dialog/status/error_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/sprint_card.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

class SprintBlocStateHandling {
  /// *** Listener Side *** ///
  // create sprint
  void createSprintListener(
    SprintAndTaskState state,
    BuildContext context,
    int projectId,
  ) {
    if (state.createSprintStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createSprintStatus == CasualStatus.success) {
      context.pop();
      context.read<SprintAndTaskBloc>().add(
        ShowProjectSprintsEvent(projectId: projectId),
      );
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.createSprintStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  // Update sprint
  void updateSprintListener(
    SprintAndTaskState state,
    BuildContext context,
    int projectId,
  ) {
    if (state.updateSprintStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.updateSprintStatus == CasualStatus.success) {
      context.pop();
      context.read<SprintAndTaskBloc>().add(
        ShowProjectSprintsEvent(projectId: projectId),
      );
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.projectDetails);
        context.pop();
      });
    } else if (state.updateSprintStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  // Delete sprint
  void deletSprintListener(
    SprintAndTaskState state,
    BuildContext context,
    int projectId,
  ) {
    if (state.deleteSprintStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.deleteSprintStatus == CasualStatus.success) {
      context.pop();
      context.read<SprintAndTaskBloc>().add(
        ShowProjectSprintsEvent(projectId: projectId),
      );
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.projectDetails);
        context.pop();
      });
    } else if (state.deleteSprintStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  // Start sprint
  void startSprintListener(
    SprintAndTaskState state,
    BuildContext context,
    int projectId,
  ) {
    if (state.startSprintStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.startSprintStatus == CasualStatus.success) {
      context.pop();
      context.read<SprintAndTaskBloc>().add(
        ShowProjectSprintsEvent(projectId: projectId),
      );
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.projectDetails);
        context.pop();
      });
    } else if (state.startSprintStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  // Complete sprint
  void completeSprintListener(
    SprintAndTaskState state,
    BuildContext context,
    int projectId,
  ) {
    if (state.completeSprintStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.completeSprintStatus == CasualStatus.success) {
      context.pop();
      context.read<SprintAndTaskBloc>().add(
        ShowProjectSprintsEvent(projectId: projectId),
      );
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.projectDetails);
        context.pop();
      });
    } else if (state.completeSprintStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  /// *** Builder Side *** ///
  // Get All Sprints List
  Widget getAllSprintsList(SprintAndTaskState state, String projectId) {
    if (state.projectSprintsListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.projectSprintsListStatus == CasualStatus.success) {
      if (state.projectSprintsList.isEmpty) {
        return Text("Empty");
      } else {
        return Text("Success");
      }
      // return GridView.builder(
      //   itemCount: state.projectSprintsList.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 4,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   itemBuilder:
      //       (context, index) => SprintCard(
      //         sprintEntity: state.projectSprintsList[index],
      //         projectId: projectId,
      //       ),
      // );
    } else if (state.projectSprintsListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // Get Started Sprint List
  Widget getStartedSprintsList(SprintAndTaskState state, String projectId) {
    if (state.projectStartedSprintsListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.projectStartedSprintsListStatus == CasualStatus.success) {
      return GridView.builder(
        itemCount: state.projectStartedSprintsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder:
            (context, index) => SprintCard(
              sprintEntity: state.projectStartedSprintsList[index],
              projectId: projectId,
            ),
      );
    } else if (state.projectStartedSprintsListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // Get Un Completed Sprint List
  Widget getUnCompletedSprintsList(SprintAndTaskState state, String projectId) {
    if (state.projectUnCompleteSprintsListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.projectUnCompleteSprintsListStatus ==
        CasualStatus.success) {
      return GridView.builder(
        itemCount: state.projectUnCompleteSprintsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder:
            (context, index) => SprintCard(
              sprintEntity: state.projectUnCompleteSprintsList[index],
              projectId: projectId,
            ),
      );
    } else if (state.projectUnCompleteSprintsListStatus ==
        CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }
}
