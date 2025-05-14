part of 'project_and_task_bloc.dart';

class ProjectAndTaskEvent {}

// Project Events
class CreateProjectEvent extends ProjectAndTaskEvent {
  final String name;
  final String description;
  final int contractId;
  final int teamId;
  final String startDate;
  final String endDate;
  final int private;

  CreateProjectEvent({
    required this.name,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.startDate,
    required this.endDate,
    required this.private,
  });
}

class UpdateProjectEvent extends ProjectAndTaskEvent {
  final int projectId;
  final String name;
  final String description;
  final int contractId;
  final int teamId;
  final String startDate;
  final String endDate;
  final int private;

  UpdateProjectEvent({
    required this.projectId,
    required this.name,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.startDate,
    required this.endDate,
    required this.private,
  });
}

class DeleteProjectsEvent extends ProjectAndTaskEvent {
  final int projectId;

  DeleteProjectsEvent({required this.projectId});
}

class ShowAllProjectsEvent extends ProjectAndTaskEvent {}

class ShowPublicProjectsEvent extends ProjectAndTaskEvent {}

class ShowUserProjectsEvent extends ProjectAndTaskEvent {}

// Task Event
class CreateTeamEvent extends ProjectAndTaskEvent {
  final String token;
  final String name;
  final int mgrId;
  final List<int> memebersIdList;

  CreateTeamEvent({
    required this.token,
    required this.name,
    required this.mgrId,
    required this.memebersIdList,
  });
}

class AddMembersEvent extends ProjectAndTaskEvent {
  final int teamId;
  final List<int> memebersIdList;

  AddMembersEvent({required this.teamId, required this.memebersIdList});
}

class ShowTeamsEvent extends ProjectAndTaskEvent {}
