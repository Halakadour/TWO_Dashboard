part of 'project_and_team_bloc.dart';

class ProjectAndTeamEvent {}

// Project Events
class CreateProjectEvent extends ProjectAndTeamEvent {
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

class UpdateProjectEvent extends ProjectAndTeamEvent {
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

class DeleteProjectsEvent extends ProjectAndTeamEvent {
  final int projectId;

  DeleteProjectsEvent({required this.projectId});
}

// Show Project Events
class ShowAllProjectsEvent extends ProjectAndTeamEvent {}

class ShowPublicProjectsEvent extends ProjectAndTeamEvent {}

class ShowUserProjectsEvent extends ProjectAndTeamEvent {}

class ShowToDoProjectsEvent extends ProjectAndTeamEvent {}

class ShowInProgressProjectsEvent extends ProjectAndTeamEvent {}

class ShowInReviewProjectsEvent extends ProjectAndTeamEvent {}

class ShowCompletedProjectsEvent extends ProjectAndTeamEvent {}

class ShowCanceledProjectsEvent extends ProjectAndTeamEvent {}

// Task Event
class CreateTeamEvent extends ProjectAndTeamEvent {
  final String name;
  final int mgrId;
  final List<int> memebersIdList;

  CreateTeamEvent({
    required this.name,
    required this.mgrId,
    required this.memebersIdList,
  });
}

class AddMembersEvent extends ProjectAndTeamEvent {
  final int teamId;
  final List<int> memebersIdList;

  AddMembersEvent({required this.teamId, required this.memebersIdList});
}

class ShowTeamsEvent extends ProjectAndTeamEvent {}
