import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  final String projectType;
  final String cooperationType;
  final int private;

  ProjectModel({
    required super.id,
    required super.fullName,
    required super.companyName,
    required super.email,
    required super.phone,
    required super.projectDescription,
    required super.cost,
    required super.duration,
    required super.requirements,
    required super.document,
    required super.contactTime,
    required super.contract,
    required super.team,
    required this.projectType,
    required this.cooperationType,
    required this.private,
  }) : super(
         pType: HelperFunctions.getProjectTypeByName(projectType),
         cType: HelperFunctions.getCooperationTypeByName(cooperationType),
         visibility: HelperFunctions.getProjectVisibilityByNum(private),
       );

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
    id: json["id"],
    fullName: json["full_name"],
    companyName: json["company_name"],
    email: json["email"],
    phone: json["phone"],
    projectType: json["project_type"],
    projectDescription: json["project_description"],
    cost: json["cost"],
    duration: json["duration"],
    requirements: json["requirements"],
    document: json["document"],
    cooperationType: json["cooperation_type"],
    contactTime: json["contact_time"],
    private: json["private"],
    contract: json["contract"],
    team: json["team"] == null ? null : Team.fromJson(json["team"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "company_name": companyName,
    "email": email,
    "phone": phone,
    "project_type": projectType,
    "project_description": projectDescription,
    "cost": cost,
    "duration": duration,
    "requirements": requirements,
    "document": document,
    "cooperation_type": cooperationType,
    "contact_time": contactTime,
    "private": private,
    "contract": contract,
    "team": team?.toJson(),
  };
}

class Team {
  final int id;
  final String name;
  final List<Member> members;

  Team({required this.id, required this.name, required this.members});

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json["id"],
    name: json["name"],
    members: List<Member>.from(json["members"].map((x) => Member.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "members": List<dynamic>.from(members.map((x) => x.toJson())),
  };
}

class Member {
  final int id;
  final String name;
  final String email;
  final bool isManager;

  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.isManager,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    isManager: json["is_manager"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "is_manager": isManager,
  };
}
