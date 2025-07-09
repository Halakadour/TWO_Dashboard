class CreateOrUpdateSprintParam {
  final String? token;
  final int? sprintId;
  final String lable;
  final String description;
  final String goal;
  final String start;
  final String end;
  final int projectId;
  final String status;

  CreateOrUpdateSprintParam({
    this.token,
    this.sprintId,
    required this.lable,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.projectId,
    required this.status,
  });
}
