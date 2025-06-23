class ShowUsersParam {
  int roleFilter;
  int approvedFilter;
  String token;
  ShowUsersParam({
    required this.roleFilter,
    required this.approvedFilter,
    required this.token,
  });
}

class UpdateEmployeeProfileParam {
  final String token;
  final String image;
  final String cv;
  final int roleId;

  UpdateEmployeeProfileParam({
    required this.token,
    required this.image,
    required this.cv,
    required this.roleId,
  });
}
