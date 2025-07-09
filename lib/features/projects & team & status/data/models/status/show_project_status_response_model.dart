import 'dart:convert';

import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';

ShowProjectStatusResponseModel showProjectStatusResponseModelFromJson(
  String str,
) => ShowProjectStatusResponseModel.fromJson(json.decode(str));

String showProjectStatusResponseModelToJson(
  ShowProjectStatusResponseModel data,
) => json.encode(data.toJson());

class ShowProjectStatusResponseModel {
  final int status;
  final String msg;
  final List<StatusModel> data;

  ShowProjectStatusResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ShowProjectStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      ShowProjectStatusResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<StatusModel>.from(
          json["data"].map((x) => StatusModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
