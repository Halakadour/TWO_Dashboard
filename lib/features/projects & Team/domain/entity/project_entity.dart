import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';

class ProjectEntity {
  final int id;
  final String name;
  final String description;
  final int contractId;
  final TeamEntity team;
  final DateTime startDate;
  final DateTime endDate;
  final TaskStatus projectStatus;
  final ProjectVisibility projectVisibility;
  final List<SprintEntity> sprintList;

  ProjectEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.contractId,
    required this.team,
    required this.startDate,
    required this.endDate,
    required this.projectStatus,
    required this.projectVisibility,
    required this.sprintList,
  });
}
