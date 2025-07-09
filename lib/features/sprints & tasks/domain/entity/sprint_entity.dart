class SprintEntity {
  final int id;
  final String label;
  final String description;
  final String goal;
  final DateTime start;
  final DateTime end;
  final String sprintStatus;

  SprintEntity({
    required this.id,
    required this.label,
    required this.description,
    required this.goal,
    required this.start,
    required this.end,
    required this.sprintStatus,
  });
}
