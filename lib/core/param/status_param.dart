class CreateStatusParam {
  final String? token;
  final int projectId;
  final String name;

  CreateStatusParam({required this.projectId, required this.name, this.token});
}

class DeleteStatusParam {
  final String? token;
  final int projectId;
  final int statusId;

  DeleteStatusParam({
    this.token,
    required this.projectId,
    required this.statusId,
  });
}

class UpdateStatusOrderParam {
  final String? token;
  final int projectId;
  final int statusId;
  final int newOrder;

  UpdateStatusOrderParam({
    this.token,
    required this.projectId,
    required this.statusId,
    required this.newOrder,
  });
}
