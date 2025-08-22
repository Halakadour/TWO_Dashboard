part of 'project_status_team_bloc.dart';

class ProjectStatusTeamEvent {}

// Project Events
class CreateProjectEvent extends ProjectStatusTeamEvent {
  UpdateProjectParam param;

  CreateProjectEvent({required this.param});
}

class UpdateProjectEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final String fullName;
  final String? companyName;
  final String email;
  final String phone;
  final String projectType;
  final String projectDescription;
  final String cost;
  final String duration;
  final String requirements;
  final String? document;
  final String cooperationType;
  final String contactTime;
  final int visibility;
  UpdateProjectEvent({
    required this.projectId,
    required this.fullName,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.projectType,
    required this.projectDescription,
    required this.cost,
    required this.duration,
    required this.requirements,
    required this.document,
    required this.cooperationType,
    required this.contactTime,
    required this.visibility,
  });
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
  final String message;

  RejectProjectsEvent({required this.projectId, required this.message});
}

class ShowEditProjectRequestEvent extends ProjectStatusTeamEvent {
  final int projectId;

  ShowEditProjectRequestEvent({required this.projectId});
}

/////   Project Manager Stuff  /////
// Accept Project
class ProjectManagerAcceptProjectEvent extends ProjectStatusTeamEvent {
  final int projectId;

  ProjectManagerAcceptProjectEvent({required this.projectId});
}

// Reject Project
class ProjectManagerRejectProjectEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final String message;

  ProjectManagerRejectProjectEvent({
    required this.projectId,
    required this.message,
  });
}

// Sent Edit Request
class ProjectManagerSentEditProjectRequestEvent extends ProjectStatusTeamEvent {
  final int projectId;
  final String message;

  ProjectManagerSentEditProjectRequestEvent({
    required this.projectId,
    required this.message,
  });
}

// Show Assign Request List
class ShowProjectAssignRequestListEvent extends ProjectStatusTeamEvent {}

// Show Accepted Assigned List
class ShowProjectAcceptedAssignedListEvent extends ProjectStatusTeamEvent {}

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
