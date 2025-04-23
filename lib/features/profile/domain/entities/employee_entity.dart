class EmployeeEntity {
  final int eId;
  final String eName;
  final String eEmail;
  final String? eImage;
  final String eRole;
  final String? eCv;

  EmployeeEntity({
    required this.eId,
    required this.eName,
    required this.eEmail,
    required this.eImage,
    required this.eRole,
    required this.eCv,
  });
}
