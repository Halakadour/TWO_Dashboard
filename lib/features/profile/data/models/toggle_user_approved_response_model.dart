import 'dart:convert';

ToggleUserApprovedResponseModel toggleUserApprovedResponseModelFromJson(
  String str,
) => ToggleUserApprovedResponseModel.fromJson(json.decode(str));

String toggleUserApprovedResponseModelToJson(
  ToggleUserApprovedResponseModel data,
) => json.encode(data.toJson());

class ToggleUserApprovedResponseModel {
  final int status;
  final String msg;
  final List<dynamic> data;

  ToggleUserApprovedResponseModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory ToggleUserApprovedResponseModel.fromJson(Map<String, dynamic> json) =>
      ToggleUserApprovedResponseModel(
        status: json["status"],
        msg: json["msg"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
