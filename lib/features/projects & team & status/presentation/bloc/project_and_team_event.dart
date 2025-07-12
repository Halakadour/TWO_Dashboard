part of 'project_and_team_bloc.dart';

class ProjectAndTeamEvent {}

// Project Events
class CreateProjectEvent extends ProjectAndTeamEvent {
  UpdateProjectParam param;

  CreateProjectEvent({required this.param});
}

class UpdateProjectEvent extends ProjectAndTeamEvent {
  UpdateProjectParam param;

  UpdateProjectEvent({required this.param});
}

class DeleteProjectsEvent extends ProjectAndTeamEvent {
  final int projectId;

  DeleteProjectsEvent({required this.projectId});
}

class ApproveProjectsEvent extends ProjectAndTeamEvent {
  final int projectId;

  ApproveProjectsEvent({required this.projectId});
}

class RejectProjectsEvent extends ProjectAndTeamEvent {
  final int projectId;

  RejectProjectsEvent({required this.projectId});
}

class SentEditProjectMessageEvent extends ProjectAndTeamEvent {
  final int projectId;
  final String message;

  SentEditProjectMessageEvent({required this.projectId, required this.message});
}

class ShowEditProjectRequestEvent extends ProjectAndTeamEvent {
  final int projectId;

  ShowEditProjectRequestEvent({required this.projectId});
}

// Show Project Events
class ShowAllProjectsEvent extends ProjectAndTeamEvent {}

class ShowPublicProjectsEvent extends ProjectAndTeamEvent {}

class ShowUserProjectsEvent extends ProjectAndTeamEvent {}

class ShowPendedProjectsEvent extends ProjectAndTeamEvent {}

// Status Events
class CreateStatusEvent extends ProjectAndTeamEvent {
  final int projectId;
  final String statusName;

  CreateStatusEvent({required this.projectId, required this.statusName});
}

class DeleteStatusEvent extends ProjectAndTeamEvent {
  final int projectId;
  final int statusId;

  DeleteStatusEvent({required this.projectId, required this.statusId});
}

class UpdateStatusOrderEvent extends ProjectAndTeamEvent {
  final int projectId;
  final int statusId;
  final int newOrder;

  UpdateStatusOrderEvent({
    required this.projectId,
    required this.statusId,
    required this.newOrder,
  });
}

class ShowProjectStatusEvent extends ProjectAndTeamEvent {
  final int projectId;

  ShowProjectStatusEvent({required this.projectId});
}

// Team Events
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

class AddProjectTeamEvent extends ProjectAndTeamEvent {
  final int projectId;
  final int teamId;

  AddProjectTeamEvent({required this.projectId, required this.teamId});
}
