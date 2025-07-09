import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

class TaskModel extends TaskEntity {
  final String project;
  final String sprint;
  final String status;
  final String priority;
  final String completion;
  final DateTime start;
  final DateTime end;

  TaskModel({
    required super.title,
    required super.description,
    required this.project,
    required this.sprint,
    required this.status,
    required super.assignedTo,
    required this.priority,
    required this.completion,
    required this.start,
    required this.end,
  }) : super(
         id: 0,
         projectId: 0,
         projectName: "name",
         sprintName: "name",
         sprintId: 0,
         taskStatus: WorkStatus.toDo,
         tPriority: Priority.low,
         startDate: start,
         endDate: end,
         tCompletion: double.parse(completion),
       );

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    description: json["description"],
    project: json["project"],
    sprint: json["sprint"],
    status: json["status"],
    assignedTo: json["assigned_to"],
    priority: json["priority"],
    completion: json["completion"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "project": project,
    "sprint": sprint,
    "status": status,
    "assigned_to": assignedTo,
    "priority": priority,
    "completion": completion,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
  };
}
