import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/empty_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/dialog/status/error_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/backlog_card.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/task_card.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/status_kanban_view.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/sprint.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

class TaskBlocStateHandling {
  /// *** Listener Side *** ///
  /// create task
  void createTaskListener(SprintAndTaskState state, BuildContext context) {
    if (state.createTaskStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createTaskStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.createTaskStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  /// Update task
  void updateTaskListener(SprintAndTaskState state, BuildContext context) {
    if (state.updateTaskStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.updateTaskStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.updateTaskStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  // Delete task
  void deleteTaskListener(SprintAndTaskState state, BuildContext context) {
    if (state.deleteTaskStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.deleteTaskStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.deleteTaskStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.errorMessage);
    }
  }

  /// *** Builder Side *** ///
  // List of pended sprints with list of tasks inside it
  Widget getPendedSprintTasksList(
    SprintAndTaskState state,
    int projectId,
    Team? team,
  ) {
    if (state.pendedSprintTasksListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.pendedSprintTasksListStatus == CasualStatus.success) {
      if (state.pendedSprintTasksList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return ListView.builder(
          itemCount: state.pendedSprintTasksList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:
              (context, index) => BacklogCard(
                sprint: state.pendedSprintTasksList[index],
                projectId: projectId,
                team: team,
                showButton: true,
              ),
        );
      }
    } else if (state.pendedSprintTasksListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // List of backlog tasks that don't belong to a sprint
  Widget getBacklogTasksList(
    SprintAndTaskState state,
    int projectId,
    Team? team,
  ) {
    if (state.backlogTasksListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.backlogTasksListStatus == CasualStatus.success) {
      if (state.backlogTasksList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return BacklogCard(
          sprint: Sprint(
            id: 0,
            label: "Backlog Sprint",
            description: "description",
            goal: "goal",
            start: DateTime.now(),
            end: DateTime.now(),
            status: "Backloged",
            tasks: state.backlogTasksList,
          ),
          projectId: projectId,
          team: team,
          showButton: false,
        );
      }
    } else if (state.backlogTasksListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // list of status for project board
  Widget getProjectBoardList(SprintAndTaskState state, int projectId) {
    if (state.projectBoardListStatus == CasualStatus.loading) {
      return Center(child: LoadingStatusAnimation());
    } else if (state.projectBoardListStatus == CasualStatus.success) {
      // return Text("Success");
      if (state.projectBoardList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return StatusKanbanView(
          statusList: state.projectBoardList,
          projectId: projectId,
        );
      }
    } else if (state.projectBoardListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // Get my task list inside this project
  Widget getMyTaskListInsideTheProject(SprintAndTaskState state) {
    if (state.myProjectTasksListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.myProjectTasksListStatus == CasualStatus.success) {
      if (state.myProjectTasksList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return GridView.builder(
          itemCount: state.myProjectTasksList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder:
              (context, index) =>
                  TaskCard(taskEntity: state.myProjectTasksList[index]),
        );
      }
    } else if (state.myProjectTasksListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // Get all the task list inside this project
  Widget getAllTaskListInsideTheProject(SprintAndTaskState state) {
    if (state.projectTasksListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.projectTasksListStatus == CasualStatus.success) {
      if (state.projectTasksList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return GridView.builder(
          itemCount: state.projectTasksList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder:
              (context, index) =>
                  TaskCard(taskEntity: state.projectTasksList[index]),
        );
      }
    } else if (state.projectTasksListStatus == CasualStatus.failure) {
      print(state.errorMessage);
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // Get all the tasks inside this sprint
  Widget getAllTasksInsideSprint(SprintAndTaskState state) {
    if (state.sprintTasksListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.sprintTasksListStatus == CasualStatus.success) {
      if (state.sprintTasksList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return ListView.builder(
          itemCount: 3,
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TaskCard(taskEntity: state.sprintTasksList[index]),
              ),
        );
      }
    } else if (state.sprintTasksListStatus == CasualStatus.failure) {
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }

  // Get my the tasks inside this sprint
  Widget getMyTasksInsideSprint(SprintAndTaskState state) {
    if (state.mySprintTasksListStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.mySprintTasksListStatus == CasualStatus.success) {
      if (state.mySprintTasksList.isEmpty) {
        return EmptyStatusAnimation();
      } else {
        return ListView.builder(
          itemCount: 3,
          itemBuilder:
              (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TaskCard(taskEntity: state.mySprintTasksList[index]),
              ),
        );
      }
    } else if (state.mySprintTasksListStatus == CasualStatus.failure) {
      return ErrorStatusAnimation(errorMessage: state.errorMessage);
    } else {
      return SizedBox();
    }
  }
}
