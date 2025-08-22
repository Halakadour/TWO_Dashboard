class NotificationModel {
  final String id;
  final String projectStatusUpdatedTo;
  final String message;
  final Project project;

  NotificationModel({
    required this.id,
    required this.projectStatusUpdatedTo,
    required this.message,
    required this.project,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        projectStatusUpdatedTo: json["project status updated to:"],
        message: json["message"],
        project: Project.fromJson(json["project"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project status updated to:": projectStatusUpdatedTo,
    "message": message,
    "project": project.toJson(),
  };
}

class Project {
  final int id;
  final String fullName;
  final String companyName;
  final String email;
  final String phone;
  final String projectType;
  final String projectDescription;
  final String cost;
  final String duration;
  final String requirements;
  final String document;
  final String cooperationType;
  final String contactTime;
  final int clientId;
  final int? teamId;
  final String status;
  final int private;
  final DateTime createdAt;
  final DateTime updatedAt;

  Project({
    required this.id,
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.projectType,
    required this.projectDescription,
    required this.cost,
    required this.duration,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.clientId,
    required this.teamId,
    required this.status,
    required this.private,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
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
    clientId: json["client_id"],
    teamId: json["team_id"],
    status: json["status"],
    private: json["private"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
    "client_id": clientId,
    "team_id": teamId,
    "status": status,
    "private": private,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
