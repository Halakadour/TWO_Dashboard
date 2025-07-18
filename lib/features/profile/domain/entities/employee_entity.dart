class EmployeeEntity {
  final int eId;
  final String eName;
  final String eEmail;
  final String? eImage;
  final String eRole;
  final String? eCv;
  final int eApproved;

  EmployeeEntity({
    required this.eId,
    required this.eName,
    required this.eEmail,
    this.eImage,
    required this.eRole,
    this.eCv,
    required this.eApproved,
  });
}
