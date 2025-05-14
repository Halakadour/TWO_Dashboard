import 'package:two_dashboard/features/projects%20&%20Team/domain/entity/team_entity.dart';

import '../../../../profile/data/models/employee_model.dart';

class TeamModel extends TeamEntity {
  final int id;
  final String name;
  final List<EmployeeModel> members;

  TeamModel({required this.id, required this.name, required this.members})
    : super(id: id, name: name, membersList: members);

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    id: json["id"],
    name: json["name"],
    members: List<EmployeeModel>.from(
      json["members"].map((x) => EmployeeModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}
