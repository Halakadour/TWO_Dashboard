import 'dart:convert';

import 'package:two_dashboard/features/projects%20&%20team/data/models/project/project_model.dart';

ShowProjectResponseModel showProjectResponseModelFromJson(String str) =>
    ShowProjectResponseModel.fromJson(json.decode(str));

String showProjectResponseModelToJson(ShowProjectResponseModel data) =>
    json.encode(data.toJson());

class ShowProjectResponseModel {
  final int status;
  final String msg;
  final List<ProjectModel> data;

  ShowProjectResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowProjectResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<ProjectModel>.from(
          json["data"].map((x) => ProjectModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
