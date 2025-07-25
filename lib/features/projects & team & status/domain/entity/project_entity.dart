import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';

class ProjectEntity {
  final int id;
  final String fullName;
  final String companyName;
  final String email;
  final String phone;
  final ProjectType pType;
  final String projectDescription;
  final String cost;
  final String duration;
  final String requirements;
  final String document;
  final CooperationType cType;
  final String contactTime;
  final ProjectVisibility visibility;
  final String status;
  final String? contract;
  final Team? team;

  ProjectEntity({
    required this.id,
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.pType,
    required this.projectDescription,
    required this.cost,
    required this.duration,
    required this.requirements,
    required this.document,
    required this.cType,
    required this.contactTime,
    required this.visibility,
    required this.status,
    this.contract,
    this.team,
  });
}
