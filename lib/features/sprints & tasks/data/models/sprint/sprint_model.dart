import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';

class SprintModel extends SprintEntity {
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

  SprintModel({
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
         sprintStatus: HelperFunctions.getWorkStatusByNum(status),
       );

  factory SprintModel.fromJson(Map<String, dynamic> json) => SprintModel(
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
