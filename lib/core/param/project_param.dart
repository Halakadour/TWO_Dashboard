class UpdateProjectParam {
  final String token;
  final int projectId;
  final String fullName;
  final String? companyName;
  final String email;
  final String phone;
  final String projectType;
  final String projectDescription;
  final String cost;
  final String duration;
  final String requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;
  final int visibility;
  UpdateProjectParam({
    required this.token,
    required this.projectId,
    required this.fullName,
    this.companyName,
    required this.email,
    required this.phone,
    required this.projectType,
    required this.projectDescription,
    required this.cost,
    required this.duration,
    required this.requirements,
    this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.visibility,
  });
}

class EditProjectRequestParam {
  String token;
  int projectId;
  String message;
  EditProjectRequestParam({
    required this.token,
    required this.projectId,
    required this.message,
  });
}
