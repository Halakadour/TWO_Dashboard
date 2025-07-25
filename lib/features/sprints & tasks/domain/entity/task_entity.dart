import 'package:two_dashboard/core/network/enums.dart';

class TaskEntity {
  final int id;
  final String title;
  final String description;
  final TaskStatus taskStatus;
  final String assignedTo;
  final TaskPriority taskPriority;
  final double taskCompletion;
  final DateTime startDate;
  final DateTime endDate;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.taskStatus,
    required this.assignedTo,
    required this.taskPriority,
    required this.taskCompletion,
    required this.startDate,
    required this.endDate,
  });
}
