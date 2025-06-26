import 'package:two_dashboard/core/network/enums.dart';

class SprintEntity {
  final int id;
  final String label;
  final String description;
  final String goal;
  final DateTime start;
  final DateTime end;
  final WorkStatus sprintStatus;
  final int projectID;

  SprintEntity({
    required this.id,
    required this.label,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.sprintStatus,
    required this.projectID,
  });
}
