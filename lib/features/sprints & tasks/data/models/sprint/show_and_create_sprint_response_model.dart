import 'dart:convert';

import 'package:two_dashboard/features/projects%20&%20team/data/models/project/project_model.dart';

ShowAndCreateSprintResponseModel showAndCreateSprintResponseModelFromJson(
  String str,
) => ShowAndCreateSprintResponseModel.fromJson(json.decode(str));

String showAndCreateSprintResponseModelToJson(
  ShowAndCreateSprintResponseModel data,
) => json.encode(data.toJson());

class ShowAndCreateSprintResponseModel {
  final int status;
  final String msg;
  final Sprint data;

  ShowAndCreateSprintResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowAndCreateSprintResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ShowAndCreateSprintResponseModel(
    status: json["status"],
    msg: json["msg"],
    data: Sprint.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}

class Sprint {
  final int id;
  final String label;
  final String description;
  final String goal;
  final DateTime start;
  final DateTime end;
  final ProjectModel project;

  Sprint({
    required this.id,
    required this.label,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.project,
  });

  factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
    id: json["id"],
    label: json["label"],
    description: json["description"],
    goal: json["goal"],
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    project: ProjectModel.fromJson(json["project"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "label": label,
    "description": description,
    "goal": goal,
    "start": start.toIso8601String(),
    "end": end.toIso8601String(),
    "project": project.toJson(),
  };
}
