part of 'project_status_team_bloc.dart';

class ProjectStatusTeamEvent {}

// Project Events
class CreateProjectEvent extends ProjectStatusTeamEvent {
  UpdateProjectParam param;

  CreateProjectEvent({required this.param});
}

class UpdateProjectEvent extends ProjectStatusTeamEvent {
  UpdateProjectParam param;

  UpdateProjectEvent({required this.param});
}

class DeleteProjectsEvent extends ProjectStatusTeamEvent {
  final int projectId;

  DeleteProjectsEvent({required this.projectId});
}

class ApproveProjectsEvent extends ProjectStatusTeamEvent {
  final int projectId;

  ApproveProjectsEvent({required this.projectId});
}

class RejectProjectsEvent extends ProjectStatusTeamEvent {
  final int projectId;

  RejectProjectsEvent({required this.projectId});
}

class SentEditProjectMessageEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final String message;

  SentEditProjectMessageEvent({required this.projectId, required this.message});
}

class ShowEditProjectRequestEvent extends ProjectStatusTeamEvent {
  final int projectId;

  ShowEditProjectRequestEvent({required this.projectId});
}

// Show Project Events
class ShowAllProjectsEvent extends ProjectStatusTeamEvent {}

class ShowPublicProjectsEvent extends ProjectStatusTeamEvent {}

class ShowUserProjectsEvent extends ProjectStatusTeamEvent {}

class ShowPendedProjectsEvent extends ProjectStatusTeamEvent {}

// Status Events
class CreateStatusEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final String statusName;

  CreateStatusEvent({required this.projectId, required this.statusName});
}

class DeleteStatusEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final int statusId;

  DeleteStatusEvent({required this.projectId, required this.statusId});
}

class UpdateStatusOrderEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final int statusId;
  final int newOrder;

  UpdateStatusOrderEvent({
    required this.projectId,
    required this.statusId,
    required this.newOrder,
  });
}

class ShowProjectStatusEvent extends ProjectStatusTeamEvent {
  final int projectId;

  ShowProjectStatusEvent({required this.projectId});
}

class ShowProjectBoardEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final List<int> sprintsIdList;

  ShowProjectBoardEvent({required this.projectId, required this.sprintsIdList});
}

// Team Events
class CreateTeamEvent extends ProjectStatusTeamEvent {
  final String name;
  final int mgrId;
  final List<int> memebersIdList;

  CreateTeamEvent({
    required this.name,
    required this.mgrId,
    required this.memebersIdList,
  });
}

class AddMembersEvent extends ProjectStatusTeamEvent {
  final int teamId;
  final List<int> memebersIdList;

  AddMembersEvent({required this.teamId, required this.memebersIdList});
}

class ShowTeamsEvent extends ProjectStatusTeamEvent {}

class AddProjectTeamEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final int teamId;

  AddProjectTeamEvent({required this.projectId, required this.teamId});
}
