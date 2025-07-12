part of 'sprint_and_task_bloc.dart';

class SprintAndTaskState {
  final int? statusNum;
  final String errorMessage;
  // Sprint Actions
  final CasualStatus createSprintStatus;
  final CasualStatus updateSprintStatus;
  final CasualStatus deleteSprintStatus;
  final CasualStatus startSprintStatus;
  final CasualStatus completeSprintStatus;

  // Sprint Lists (Uncomplete, Started, Casual)
  final List<SprintEntity> projectUnCompleteSprintsList;
  final CasualStatus projectUnCompleteSprintsListStatus;

  final List<SprintEntity> projectStartedSprintsList;
  final CasualStatus projectStartedSprintsListStatus;

  final List<SprintEntity> projectSprintsList;
  final CasualStatus projectSprintsListStatus;

  // Sprint Details
  final SprintEntity? sprintEntity;
  final CasualStatus sprintEntityStatus;

  // Task Actions
  final CasualStatus createTaskStatus;
  final CasualStatus updateTaskStatus;
  final CasualStatus deleteTaskStatus;
  final CasualStatus createBacklogTasksSprintStatus;

  // Tasks Lists (Project-Tasks, Sprint-Tasks, My-Project-Tasks, My-Sprints-Tasks- Backlog-Tasks)

  final List<TaskEntity> projectTasksList;
  final CasualStatus projectTasksListStatus;

  final List<TaskEntity> sprintTasksList;
  final CasualStatus sprintTasksListStatus;

  final List<TaskEntity> myProjectTasksList;
  final CasualStatus myProjectTasksListStatus;

  final List<TaskEntity> mySprintTasksList;
  final CasualStatus mySprintTasksListStatus;

  final List<TaskEntity> backlogTasksList;
  final CasualStatus backlogTasksListStatus;

  // Other Lists (Project-Board-Status-List, Pended-Sprint-Tasks-List)

  final List<StatusModel> projectBoardList;
  final CasualStatus projectBoardListStatus;

  final List<Sprint> pendedSprintTasksList;
  final CasualStatus pendedSprintTasksListStatus;

  // Tasks Details
  final TaskEntity? taskEntity;
  final CasualStatus taskEntityStatus;

  SprintAndTaskState({
    this.statusNum,
    this.errorMessage = "",
    // Sprint-State
    this.createSprintStatus = CasualStatus.initial,
    this.updateSprintStatus = CasualStatus.initial,
    this.deleteSprintStatus = CasualStatus.initial,
    this.startSprintStatus = CasualStatus.initial,
    this.completeSprintStatus = CasualStatus.initial,
    this.projectUnCompleteSprintsList = const [],
    this.projectUnCompleteSprintsListStatus = CasualStatus.initial,
    this.projectStartedSprintsList = const [],
    this.projectStartedSprintsListStatus = CasualStatus.initial,
    this.projectSprintsList = const [],
    this.projectSprintsListStatus = CasualStatus.initial,
    this.sprintEntity,
    this.sprintEntityStatus = CasualStatus.initial,
    // Task-State
    this.createTaskStatus = CasualStatus.initial,
    this.updateTaskStatus = CasualStatus.initial,
    this.deleteTaskStatus = CasualStatus.initial,
    this.createBacklogTasksSprintStatus = CasualStatus.initial,
    this.projectTasksList = const [],
    this.projectTasksListStatus = CasualStatus.initial,
    this.sprintTasksList = const [],
    this.sprintTasksListStatus = CasualStatus.initial,
    this.myProjectTasksList = const [],
    this.myProjectTasksListStatus = CasualStatus.initial,
    this.mySprintTasksList = const [],
    this.mySprintTasksListStatus = CasualStatus.initial,
    this.backlogTasksList = const [],
    this.backlogTasksListStatus = CasualStatus.initial,
    this.projectBoardList = const [],
    this.projectBoardListStatus = CasualStatus.initial,
    this.pendedSprintTasksList = const [],
    this.pendedSprintTasksListStatus = CasualStatus.initial,
    this.taskEntity,
    this.taskEntityStatus = CasualStatus.initial,
  });

  SprintAndTaskState copyWith({
    int? statusNum,
    String? errorMessage,
    CasualStatus? createSprintStatus,
    CasualStatus? updateSprintStatus,
    CasualStatus? deleteSprintStatus,
    CasualStatus? startSprintStatus,
    CasualStatus? completeSprintStatus,
    List<SprintEntity>? projectUnCompleteSprintsList,
    CasualStatus? projectUnCompleteSprintsListStatus,
    List<SprintEntity>? projectStartedSprintsList,
    CasualStatus? projectStartedSprintsListStatus,
    List<SprintEntity>? projectSprintsList,
    CasualStatus? projectSprintsListStatus,
    SprintEntity? sprintEntity,
    CasualStatus? sprintEntityStatus,
    CasualStatus? createTaskStatus,
    CasualStatus? updateTaskStatus,
    CasualStatus? deleteTaskStatus,
    CasualStatus? createBacklogTasksSprintStatus,
    List<TaskEntity>? projectTasksList,
    CasualStatus? projectTasksListStatus,
    List<TaskEntity>? sprintTasksList,
    CasualStatus? sprintTasksListStatus,
    List<TaskEntity>? myProjectTasksList,
    CasualStatus? myProjectTasksListStatus,
    List<TaskEntity>? mySprintTasksList,
    CasualStatus? mySprintTasksListStatus,
    List<TaskEntity>? backlogTasksList,
    CasualStatus? backlogTasksListStatus,
    List<StatusModel>? projectBoardList,
    CasualStatus? projectBoardListStatus,
    List<Sprint>? pendedSprintTasksList,
    CasualStatus? pendedSprintTasksListStatus,
    TaskEntity? taskEntity,
    CasualStatus? taskEntityStatus,
  }) {
    return SprintAndTaskState(
      statusNum: statusNum ?? this.statusNum,
      errorMessage: errorMessage ?? this.errorMessage,
      createSprintStatus: createSprintStatus ?? this.createSprintStatus,
      updateSprintStatus: updateSprintStatus ?? this.updateSprintStatus,
      deleteSprintStatus: deleteSprintStatus ?? this.deleteSprintStatus,
      startSprintStatus: startSprintStatus ?? this.startSprintStatus,
      completeSprintStatus: completeSprintStatus ?? this.completeSprintStatus,
      projectUnCompleteSprintsList:
          projectUnCompleteSprintsList ?? this.projectUnCompleteSprintsList,
      projectUnCompleteSprintsListStatus:
          projectUnCompleteSprintsListStatus ??
          this.projectUnCompleteSprintsListStatus,
      projectStartedSprintsList:
          projectStartedSprintsList ?? this.projectStartedSprintsList,
      projectStartedSprintsListStatus:
          projectStartedSprintsListStatus ??
          this.projectStartedSprintsListStatus,
      projectSprintsList: projectSprintsList ?? this.projectSprintsList,
      projectSprintsListStatus:
          projectSprintsListStatus ?? this.projectSprintsListStatus,
      sprintEntity: sprintEntity ?? this.sprintEntity,
      sprintEntityStatus: sprintEntityStatus ?? this.sprintEntityStatus,
      createTaskStatus: createTaskStatus ?? this.createTaskStatus,
      updateTaskStatus: updateTaskStatus ?? this.updateTaskStatus,
      deleteTaskStatus: deleteTaskStatus ?? this.deleteTaskStatus,
      createBacklogTasksSprintStatus:
          createBacklogTasksSprintStatus ?? this.createBacklogTasksSprintStatus,
      projectTasksList: projectTasksList ?? this.projectTasksList,
      projectTasksListStatus:
          projectTasksListStatus ?? this.projectTasksListStatus,
      sprintTasksList: sprintTasksList ?? this.sprintTasksList,
      sprintTasksListStatus:
          sprintTasksListStatus ?? this.sprintTasksListStatus,
      myProjectTasksList: myProjectTasksList ?? this.myProjectTasksList,
      myProjectTasksListStatus:
          myProjectTasksListStatus ?? this.myProjectTasksListStatus,
      mySprintTasksList: mySprintTasksList ?? this.mySprintTasksList,
      mySprintTasksListStatus:
          mySprintTasksListStatus ?? this.mySprintTasksListStatus,
      backlogTasksList: backlogTasksList ?? this.backlogTasksList,
      backlogTasksListStatus:
          backlogTasksListStatus ?? this.backlogTasksListStatus,
      projectBoardList: projectBoardList ?? this.projectBoardList,
      projectBoardListStatus:
          projectBoardListStatus ?? this.projectBoardListStatus,
      pendedSprintTasksList:
          pendedSprintTasksList ?? this.pendedSprintTasksList,
      pendedSprintTasksListStatus:
          pendedSprintTasksListStatus ?? this.pendedSprintTasksListStatus,
      taskEntity: taskEntity ?? this.taskEntity,
      taskEntityStatus: taskEntityStatus ?? this.taskEntityStatus,
    );
  }
}
