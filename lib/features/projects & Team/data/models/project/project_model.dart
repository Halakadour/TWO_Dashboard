import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/features/projects & team/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects & team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/sprints & tasks/domain/entity/sprint_entity.dart';

DateTime parseFlexibleDate(String date) {
  try {
    return DateTime.parse(date.replaceAll('/', '-'));
  } catch (_) {
    return DateTime.now(); // أو رمي خطأ أو أي بديل حسب حالتك
  }
}

class ProjectModel extends ProjectEntity {
  final int id;
  final String name;
  final String description;
  final int contractId;
  final int teamId;
  final DateTime start;
  final DateTime end;
  final int? status;
  final int private;
  final Team team;
  final List<Sprint> sprints;

  ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.start,
    required this.end,
    required this.status,
    required this.private,
    required this.team,
    required this.sprints,
  }) : super(
         id: id,
         name: name,
         description: description,
         contractId: contractId,
         team: team,
         startDate: start,
         endDate: end,
         projectStatus: HelperFunctions.getTaskStatusByNum(status!),
         projectVisibility: HelperFunctions.getProjectVisibilityByNum(private),
         sprintList: sprints,
       );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    contractId: json["contract_id"],
    teamId: json["team_id"],
    start: parseFlexibleDate(json["start"]),
    end: parseFlexibleDate(json["end"]),
    status: json["status"],
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
    "private": private,
    "team": team.toJson(),
    "sprints": List<dynamic>.from(sprints.map((x) => x.toJson())),
  };
}

class Sprint extends SprintEntity {
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
  }) : super(
         id: id,
         label: label,
         description: description,
         goal: goal,
         start: start,
         end: end,
         projectID: projectId,
         sprintStatus: HelperFunctions.getTaskStatusByNum(status),
       );

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

class Team extends TeamEntity {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Team({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  }) : super(id: id, name: name, membersList: []);

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
