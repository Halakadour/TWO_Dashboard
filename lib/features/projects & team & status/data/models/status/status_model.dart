class StatusModel {
  final int id;
  final String name;
  final int order;
  final List<Task> tasks;

  StatusModel({
    required this.id,
    required this.name,
    required this.order,
    required this.tasks,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
    id: json["id"],
    name: json["name"],
    order: json["order"],
    tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "order": order,
    "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
  };
}

class Task {
  final String title;
  final String description;
  final String project;
  final String sprint;
  final String status;
  final String assignedTo;
  final String priority;
  final int completion;
  final DateTime start;
  final DateTime end;

  Task({
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

  factory Task.fromJson(Map<String, dynamic> json) => Task(
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
    "start":
        "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end":
        "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
  };
}
