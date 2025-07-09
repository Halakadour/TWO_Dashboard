import 'dart:convert';

CreateProjectStatusResponseModel createProjectStatusResponseModelFromJson(
  String str,
) => CreateProjectStatusResponseModel.fromJson(json.decode(str));

String createProjectStatusResponseModelToJson(
  CreateProjectStatusResponseModel data,
) => json.encode(data.toJson());

class CreateProjectStatusResponseModel {
  final int status;
  final String msg;
  final Data data;

  CreateProjectStatusResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateProjectStatusResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => CreateProjectStatusResponseModel(
    status: json["status"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  final int id;
  final String name;
  final String description;
  final int contractId;
  final int teamId;
  final DateTime start;
  final DateTime end;
  final int status;
  final List<TaskStatus> taskStatuses;
  final int private;
  final Team team;
  final List<Sprint> sprints;

  Data({
    required this.id,
    required this.name,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.start,
    required this.end,
    required this.status,
    required this.taskStatuses,
    required this.private,
    required this.team,
    required this.sprints,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    contractId: json["contract_id"],
    teamId: json["team_id"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    status: json["status"],
    taskStatuses: List<TaskStatus>.from(
      json["task_statuses"].map((x) => TaskStatus.fromJson(x)),
    ),
    private: json["private"],
    team: Team.fromJson(json["team"]),
    sprints: List<Sprint>.from(json["sprints"].map((x) => Sprint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "contract_id": contractId,
    "team_id": teamId,
    "start":
        "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
    "end":
        "${end.year.toString().padLeft(4, '0')}-${end.month.toString().padLeft(2, '0')}-${end.day.toString().padLeft(2, '0')}",
    "status": status,
    "task_statuses": List<dynamic>.from(taskStatuses.map((x) => x.toJson())),
    "private": private,
    "team": team.toJson(),
    "sprints": List<dynamic>.from(sprints.map((x) => x.toJson())),
  };
}

class Sprint {
  final int id;
  final String label;
  final String description;
  final String goal;
  final DateTime start;
  final DateTime end;
  final int projectId;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Sprint({
    required this.id,
    required this.label,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.projectId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    goal: json["goal"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    projectId: json["project_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "description": description,
    "goal": goal,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "project_id": projectId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class TaskStatus {
  final int id;
  final String name;
  final int projectId;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;

  TaskStatus({
    required this.id,
    required this.name,
    required this.projectId,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TaskStatus.fromJson(Map<String, dynamic> json) => TaskStatus(
    id: json["id"],
    name: json["name"],
    projectId: json["project_id"],
    order: json["order"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "project_id": projectId,
    "order": order,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Team {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Team({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
