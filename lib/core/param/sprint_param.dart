class CreateSprintParam {
  final String token;
  final String lable;
  final String description;
  final String goal;
  final String start;
  final String end;
  final int projectId;
  final String status;

  CreateSprintParam({
    required this.token,
    required this.lable,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.projectId,
    required this.status,
  });
}

class UpdateSprintParam {
  final String token;
  final int sprintId;
  final String lable;
  final String description;
  final String goal;
  final String start;
  final String end;
  final int projectId;
  final String status;

  UpdateSprintParam({
    required this.sprintId,
    required this.token,
    required this.lable,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.projectId,
    required this.status,
  });
}

class StartSprintParam {
  final String token;
  final int projectId;
  final int sprintId;

  StartSprintParam({
    required this.token,
    required this.projectId,
    required this.sprintId,
  });
}

class CompleteSprintParam {
  final String token;
  final int projectId;
  final int sprintId;
  // It takes null, new, existing
  final String? action;
  // required if the action is new
  final String? newSprintLabel;
  // required if the action is existing
  final int? existingSprintId;

  CompleteSprintParam({
    required this.token,
    required this.projectId,
    required this.sprintId,
    this.action,
    this.newSprintLabel,
    this.existingSprintId,
  });
}
