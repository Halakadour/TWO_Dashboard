class CreateOrUpdateTaskParam {
  final String? token;
  final int? taskId;
  final String title;
  final String description;
  final int projectId;
  final int sprintId;
  final int status;
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
    required this.status,
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
