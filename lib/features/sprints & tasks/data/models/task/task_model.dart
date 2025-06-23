class TaskModel {
  final String title;
  final String description;
  final String project;
  final String sprint;
  final String status;
  final String assignedTo;
  final String priority;
  final String completion;
  final DateTime start;
  final DateTime end;

  TaskModel({
    required this.title,
    required this.description,
    required this.project,
    required this.sprint,
    required this.status,
    required this.assignedTo,
    required this.priority,
    required this.completion,
    required this.start,
    required this.end,
  });

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
