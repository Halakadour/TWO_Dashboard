import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  final String priority;
  final String completion;
  final String status;
  final DateTime start;
  final DateTime end;
  final dynamic sprint;

  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.assignedTo,
    required this.priority,
    required this.completion,
    required this.status,
    required this.start,
    required this.end,
    required this.sprint,
  }) : super(
         tPriority: HelperFunctions.getPriorityByName(priority),
         taskStatus: HelperFunctions.getWorkStatusByName(status),
         tCompletion: double.parse(completion),
         startDate: start,
         endDate: end,
       );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    sprint: json["sprint"],
    status: json["status"],
    assignedTo: json["assigned_to"],
    priority: json["priority"],
    completion: json["completion"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "sprint": sprint,
    "status": status,
    "assigned_to": assignedTo,
    "priority": priority,
    "completion": completion,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
  };
}
