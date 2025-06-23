import 'dart:convert';

import 'package:two_dashboard/features/projects%20&%20team/data/models/project/project_model.dart';

ShowProjectSprintsResponseModel showProjectSprintsResponseModelFromJson(
  String str,
) => ShowProjectSprintsResponseModel.fromJson(json.decode(str));

String showProjectSprintsResponseModelToJson(
  ShowProjectSprintsResponseModel data,
) => json.encode(data.toJson());

class ShowProjectSprintsResponseModel {
  final int status;
  final String msg;
  final ProjectModel data;

  ShowProjectSprintsResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowProjectSprintsResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowProjectSprintsResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: ProjectModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}
