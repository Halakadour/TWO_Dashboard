part of 'sprint_and_task_bloc.dart';

class SprintAndTaskEvent {}

// Sprint Events
class CreateSprintEvent extends SprintAndTaskEvent {
  CreateSprintEvent({required this.param});
  CreateOrUpdateSprintParam param;
}

class UpdateSprintEvent extends SprintAndTaskEvent {
  UpdateSprintEvent({required this.param});
  CreateOrUpdateSprintParam param;
}

class DeleteSprintEvent extends SprintAndTaskEvent {
  DeleteSprintEvent({required this.sprintId});
  int sprintId;
}

class ShowProjectSprintsEvent extends SprintAndTaskEvent {
  ShowProjectSprintsEvent({required this.projectId});
  int projectId;
}

class ShowSprintDetailsEvent extends SprintAndTaskEvent {
  ShowSprintDetailsEvent({required this.sprintId});
  int sprintId;
}

// Task Events

class CreateTaskEvent extends SprintAndTaskEvent {
  CreateTaskEvent({required this.param});
  CreateOrUpdateTaskParam param;
}

class UpdateTaskEvent extends SprintAndTaskEvent {
  UpdateTaskEvent({required this.param});
  CreateOrUpdateTaskParam param;
}

class DeleteTaskEvent extends SprintAndTaskEvent {
  DeleteTaskEvent({required this.taskId});
  int taskId;
}

class ShowSprintTasksEvent extends SprintAndTaskEvent {
  ShowSprintTasksEvent({required this.sprintId});
  int sprintId;
}

class ShowTaskDetailsEvent extends SprintAndTaskEvent {
  ShowTaskDetailsEvent({required this.taskId});
  int taskId;
}

class ShowMyProjectTasksEvent extends SprintAndTaskEvent {
  ShowMyProjectTasksEvent({required this.projectId, required this.proirity});
  final int projectId;
  final String proirity;
}

class ShowMySprintTasksEvent extends SprintAndTaskEvent {
  ShowMySprintTasksEvent({
    required this.projectId,
    required this.sprinttId,
    required this.proirity,
    required this.status,
  });
  final int projectId;
  final int sprinttId;
  final String proirity;
  final String status;
}
