class CreateOrUpdateTaskParam {
  final String? token;
  final int? taskId;
  final String title;
  final String description;
  final int projectId;
  final int sprintId;
  final int statusId;
  final int userId;
  final String priority;
  final double completion;
  final String startDate;
  final String endDate;

  CreateOrUpdateTaskParam({
    this.token,
    this.taskId,
    required this.title,
    required this.description,
    required this.projectId,
    required this.sprintId,
    required this.statusId,
    required this.userId,
    required this.priority,
    required this.completion,
    required this.startDate,
    required this.endDate,
  });
}

class ShowMyProjectTasksParam {
  final String token;
  final int projectId;
  final String proirity;

  ShowMyProjectTasksParam({
    required this.token,
    required this.projectId,
    required this.proirity,
  });
}

class ShowMySprintTasksParam {
  final String token;
  final int projectId;
  final int sprinttId;
  final String proirity;
  final String status;

  ShowMySprintTasksParam({
    required this.token,
    required this.projectId,
    required this.sprinttId,
    required this.proirity,
    required this.status,
  });
}

class ShowProjectBoardParam {
  final String token;
  final int projectId;
  final List<int> sprintsIdList;

  ShowProjectBoardParam({
    required this.token,
    required this.projectId,
    required this.sprintsIdList,
  });
}

// create BacklogTasks Sprints
//"label": "Sprint 2",
// "description": "Second sprint tasks",
// "goal": "Complete main features",
// "start": "2025-07-05",
// "end": "2025-07-15",
// "project_id": 1,
// "tasks_ids": [2, 3]
class CreateBacklogTasksSprintParam {
  final String token;
  final int projectId;
  final String label;
  final String description;
  final String goal;
  final String startDate;
  final String endDate;
  final List<int> tasksIds;

  CreateBacklogTasksSprintParam({
    required this.token,
    required this.projectId,
    required this.label,
    required this.description,
    required this.goal,
    required this.startDate,
    required this.endDate,
    required this.tasksIds,
  });
}
