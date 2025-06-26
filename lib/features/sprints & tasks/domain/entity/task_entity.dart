import 'package:two_dashboard/core/network/enums.dart';

class TaskEntity {
  final int id;
  final String title;
  final String description;
  final String projectName;
  final int projectId;
  final String sprintName;
  final int sprintId;
  final WorkStatus taskStatus;
  final String assignedTo;
  final Priority priority;
  final double completion;
  final DateTime startDate;
  final DateTime endDate;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.projectName,
    required this.projectId,
    required this.sprintName,
    required this.sprintId,
    required this.taskStatus,
    required this.assignedTo,
    required this.priority,
    required this.completion,
    required this.startDate,
    required this.endDate,
  });
}
