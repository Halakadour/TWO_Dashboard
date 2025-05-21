import 'dart:convert';

import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/features/projects%20&%20team/data/models/project/project_model.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';

List<ShowUserProjectsResponseModel> showUserProjectsResponseModelFromJson(
  String str,
) => List<ShowUserProjectsResponseModel>.from(
  json.decode(str).map((x) => ShowUserProjectsResponseModel.fromJson(x)),
);

String showUserProjectsResponseModelToJson(
  List<ShowUserProjectsResponseModel> data,
) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowUserProjectsResponseModel extends ProjectEntity {
  final int id;
  final String name;
  final String description;
  final int contractId;
  final int teamId;
  final DateTime start;
  final DateTime end;
  final int status;
  final int private;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShowUserProjectsResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.start,
    required this.end,
    required this.status,
    required this.private,
    required this.createdAt,
    required this.updatedAt,
  }) : super(
         id: id,
         name: name,
         description: description,
         contractId: contractId,
         team: Team(
           id: id,
           name: name,
           createdAt: createdAt,
           updatedAt: updatedAt,
         ),
         startDate: start,
         endDate: end,
         projectStatus: HelperFunctions.getTaskStatusByNum(status),
         projectVisibility: HelperFunctions.getProjectVisibilityByNum(private),
         sprintList: [],
       );

  factory ShowUserProjectsResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowUserProjectsResponseModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        contractId: json["contract_id"],
        teamId: json["team_id"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        status: json["status"],
        private: json["private"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
