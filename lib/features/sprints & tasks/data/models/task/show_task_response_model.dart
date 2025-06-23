import 'dart:convert';

import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/task/task_model.dart';

ShowTaskResponseModel showTaskResponseModelFromJson(String str) =>
    ShowTaskResponseModel.fromJson(json.decode(str));

String showTaskResponseModelToJson(ShowTaskResponseModel data) =>
    json.encode(data.toJson());

class ShowTaskResponseModel {
  final int status;
  final String msg;
  final TaskModel data;

  ShowTaskResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowTaskResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: TaskModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}
