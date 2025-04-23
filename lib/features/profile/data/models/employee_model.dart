import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

class EmployeeModel extends EmployeeEntity {
  final int id;
  final String name;
  final String email;
  final String? image;
  final String role;
  final String? cv;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.role,
    required this.cv,
  }) : super(
         eId: id,
         eName: name,
         eEmail: email,
         eImage: image,
         eRole: role,
         eCv: cv,
       );

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    role: json["role"],
    cv: json["cv"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "image": image,
    "role": role,
    "cv": cv,
  };
}
