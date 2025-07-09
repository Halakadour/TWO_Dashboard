import 'dart:convert';

import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/sprint_model.dart';

ShowAndCreateSprintResponseModel showAndCreateSprintResponseModelFromJson(
  String str,
) => ShowAndCreateSprintResponseModel.fromJson(json.decode(str));

String showAndCreateSprintResponseModelToJson(
  ShowAndCreateSprintResponseModel data,
) => json.encode(data.toJson());

class ShowAndCreateSprintResponseModel {
  final int status;
  final String msg;
  final SprintModel data;

  ShowAndCreateSprintResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowAndCreateSprintResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ShowAndCreateSprintResponseModel(
    status: json["status"],
    msg: json["msg"],
    data: SprintModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data.toJson(),
  };
}
