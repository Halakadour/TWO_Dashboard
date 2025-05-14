import 'dart:convert';

import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/task/task_model.dart';

CreateTaskResponseModel createTaskResponseModelFromJson(String str) =>
    CreateTaskResponseModel.fromJson(json.decode(str));

String createTaskResponseModelToJson(CreateTaskResponseModel data) =>
    json.encode(data.toJson());

class CreateTaskResponseModel {
  final int status;
  final String msg;
  final TaskModel data;

  CreateTaskResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory CreateTaskResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateTaskResponseModel(
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
