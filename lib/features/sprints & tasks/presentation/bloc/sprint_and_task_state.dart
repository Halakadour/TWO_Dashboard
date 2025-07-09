// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sprint_and_task_bloc.dart';

class SprintAndTaskState {
  final String errorMessage;
  // Sprint Actions
  final CasualStatus createSprintStatus;
  final CasualStatus updateSprintStatus;
  final CasualStatus deleteSprintStatus;

  final List<SprintEntity> projectSprintsList;
  final CasualStatus projectSprintsListStatus;

  final SprintEntity? sprintEntity;
  final CasualStatus sprintEntityStatus;

  // Task Actions
  final CasualStatus createTaskStatus;
  final CasualStatus updateTaskStatus;
  final CasualStatus deleteTaskStatus;

  final List<TaskEntity> sprintTasksList;
  final CasualStatus sprintTasksListStatus;

  final List<TaskEntity> myProjectTasksList;
  final CasualStatus myProjectTasksListStatus;

  final List<TaskEntity> mySprintTasksList;
  final CasualStatus mySprintTasksListStatus;

  final TaskEntity? taskEntity;
  final CasualStatus taskEntityStatus;

  SprintAndTaskState({
    this.errorMessage = "",
    this.createSprintStatus = CasualStatus.initial,
    this.updateSprintStatus = CasualStatus.initial,
    this.deleteSprintStatus = CasualStatus.initial,
    this.projectSprintsList = const [],
    this.projectSprintsListStatus = CasualStatus.initial,
    this.sprintEntity,
    this.sprintEntityStatus = CasualStatus.initial,
    this.createTaskStatus = CasualStatus.initial,
    this.updateTaskStatus = CasualStatus.initial,
    this.deleteTaskStatus = CasualStatus.initial,
    this.sprintTasksList = const [],
    this.sprintTasksListStatus = CasualStatus.initial,
    this.myProjectTasksList = const [],
    this.myProjectTasksListStatus = CasualStatus.initial,
    this.mySprintTasksList = const [],
    this.mySprintTasksListStatus = CasualStatus.initial,
    this.taskEntity,
    this.taskEntityStatus = CasualStatus.initial,
  });

  SprintAndTaskState copyWith({
    String? errorMessage,
    CasualStatus? createSprintStatus,
    CasualStatus? updateSprintStatus,
    CasualStatus? deleteSprintStatus,
    List<SprintEntity>? projectSprintsList,
    CasualStatus? projectSprintsListStatus,
    SprintEntity? sprintEntity,
    CasualStatus? sprintEntityStatus,
    CasualStatus? createTaskStatus,
    CasualStatus? updateTaskStatus,
    CasualStatus? deleteTaskStatus,
    List<TaskEntity>? sprintTasksList,
    CasualStatus? sprintTasksListStatus,
    List<TaskEntity>? myProjectTasksList,
    CasualStatus? myProjectTasksListStatus,
    List<TaskEntity>? mySprintTasksList,
    CasualStatus? mySprintTasksListStatus,
    TaskEntity? taskEntity,
    CasualStatus? taskEntityStatus,
  }) {
    return SprintAndTaskState(
      errorMessage: errorMessage ?? this.errorMessage,
      createSprintStatus: createSprintStatus ?? this.createSprintStatus,
      updateSprintStatus: updateSprintStatus ?? this.updateSprintStatus,
      deleteSprintStatus: deleteSprintStatus ?? this.deleteSprintStatus,
      projectSprintsList: projectSprintsList ?? this.projectSprintsList,
      projectSprintsListStatus:
          projectSprintsListStatus ?? this.projectSprintsListStatus,
      sprintEntity: sprintEntity ?? this.sprintEntity,
      sprintEntityStatus: sprintEntityStatus ?? this.sprintEntityStatus,
      createTaskStatus: createTaskStatus ?? this.createTaskStatus,
      updateTaskStatus: updateTaskStatus ?? this.updateTaskStatus,
      deleteTaskStatus: deleteTaskStatus ?? this.deleteTaskStatus,
      sprintTasksList: sprintTasksList ?? this.sprintTasksList,
      sprintTasksListStatus:
          sprintTasksListStatus ?? this.sprintTasksListStatus,
      myProjectTasksList: myProjectTasksList ?? this.myProjectTasksList,
      myProjectTasksListStatus:
          myProjectTasksListStatus ?? this.myProjectTasksListStatus,
      mySprintTasksList: mySprintTasksList ?? this.mySprintTasksList,
      mySprintTasksListStatus:
          mySprintTasksListStatus ?? this.mySprintTasksListStatus,
      taskEntity: taskEntity ?? this.taskEntity,
      taskEntityStatus: taskEntityStatus ?? this.taskEntityStatus,
    );
  }
}
