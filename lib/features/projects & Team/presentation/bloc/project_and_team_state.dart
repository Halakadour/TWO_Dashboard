// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_and_team_bloc.dart';

class ProjectAndTeamState {
  final String message;
  // Project State
  final CasualStatus createProjectStatus;
  final CasualStatus updateProjectStatus;
  final CasualStatus deleteProjectStatus;
  final CasualStatus approveProjectStatus;
  final CasualStatus rejectProjectStatus;
  final CasualStatus editRequestProjectStatus;
  final CasualStatus editProjectRequestsListStatus;
  final List<MessageModel> editProjectRequestsList;
  // public & private project List
  final List<ProjectEntity> publicProjectsList;
  final CasualStatus publicProjectsListStatus;
  final List<ProjectEntity> allProjectsList;
  final CasualStatus allProjectsListStatus;
  // Project Lists Block
  final List<ProjectEntity> pendedProjectList;
  final CasualStatus pendedProjectListStatus;
  final List<ProjectEntity> toDoProjectList;
  final CasualStatus toDoProjectListStatus;
  final List<ProjectEntity> inProgressProjectList;
  final CasualStatus inProgressProjectListStatus;
  final List<ProjectEntity> inReviewProjectList;
  final CasualStatus inReviewProjectListStatus;
  final List<ProjectEntity> completedProjectList;
  final CasualStatus completedProjectListStatus;
  final List<ProjectEntity> canceldProjectList;
  final CasualStatus canceledProjectListStatus;
  // My Project List
  final List<ProjectEntity> userProjectsList;
  final CasualStatus userProjectsListStatus;
  // Team State
  final CasualStatus createTeamStatus;
  final CasualStatus addMemersStatus;
  final CasualStatus showTeamsStatus;
  final List<TeamEntity> showTeams;
  final CasualStatus addTeamStatus;

  ProjectAndTeamState({
    this.message = "",
    this.createProjectStatus = CasualStatus.initial,
    this.updateProjectStatus = CasualStatus.initial,
    this.deleteProjectStatus = CasualStatus.initial,
    this.approveProjectStatus = CasualStatus.initial,
    this.rejectProjectStatus = CasualStatus.initial,
    this.editRequestProjectStatus = CasualStatus.initial,
    this.editProjectRequestsListStatus = CasualStatus.initial,
    this.editProjectRequestsList = const [],
    this.publicProjectsList = const [],
    this.publicProjectsListStatus = CasualStatus.initial,
    this.allProjectsList = const [],
    this.allProjectsListStatus = CasualStatus.initial,
    this.pendedProjectListStatus = CasualStatus.initial,
    this.pendedProjectList = const [],
    this.toDoProjectListStatus = CasualStatus.initial,
    this.toDoProjectList = const [],
    this.inProgressProjectListStatus = CasualStatus.initial,
    this.inProgressProjectList = const [],
    this.inReviewProjectListStatus = CasualStatus.initial,
    this.inReviewProjectList = const [],
    this.completedProjectListStatus = CasualStatus.initial,
    this.completedProjectList = const [],
    this.canceledProjectListStatus = CasualStatus.initial,
    this.canceldProjectList = const [],
    this.userProjectsList = const [],
    this.userProjectsListStatus = CasualStatus.initial,
    this.createTeamStatus = CasualStatus.initial,
    this.addMemersStatus = CasualStatus.initial,
    this.showTeamsStatus = CasualStatus.initial,
    this.showTeams = const [],
    this.addTeamStatus = CasualStatus.initial,
  });

  ProjectAndTeamState copyWith({
    String? message,
    CasualStatus? createProjectStatus,
    CasualStatus? updateProjectStatus,
    CasualStatus? deleteProjectStatus,
    CasualStatus? approveProjectStatus,
    CasualStatus? rejectProjectStatus,
    CasualStatus? editRequestProjectStatus,
    CasualStatus? editProjectRequestsListStatus,
    List<MessageModel>? editProjectRequestsList,
    List<ProjectEntity>? publicProjectsList,
    CasualStatus? publicProjectsListStatus,
    List<ProjectEntity>? allProjectsList,
    CasualStatus? allProjectsListStatus,
    List<ProjectEntity>? pendedProjectList,
    CasualStatus? pendedProjectListStatus,
    List<ProjectEntity>? toDoProjectList,
    CasualStatus? toDoProjectListStatus,
    List<ProjectEntity>? inProgressProjectList,
    CasualStatus? inProgressProjectListStatus,
    List<ProjectEntity>? inReviewProjectList,
    CasualStatus? inReviewProjectListStatus,
    List<ProjectEntity>? completedProjectList,
    CasualStatus? completedProjectListStatus,
    List<ProjectEntity>? canceldProjectList,
    CasualStatus? canceledProjectListStatus,
    List<ProjectEntity>? userProjectsList,
    CasualStatus? userProjectsListStatus,
    CasualStatus? createTeamStatus,
    CasualStatus? addMemersStatus,
    CasualStatus? showTeamsStatus,
    List<TeamEntity>? showTeams,
    CasualStatus? addTeamStatus,
  }) {
    return ProjectAndTeamState(
      message: message ?? this.message,
      createProjectStatus: createProjectStatus ?? this.createProjectStatus,
      updateProjectStatus: updateProjectStatus ?? this.updateProjectStatus,
      deleteProjectStatus: deleteProjectStatus ?? this.deleteProjectStatus,
      approveProjectStatus: approveProjectStatus ?? this.approveProjectStatus,
      rejectProjectStatus: rejectProjectStatus ?? this.rejectProjectStatus,
      editRequestProjectStatus:
          editRequestProjectStatus ?? this.editRequestProjectStatus,
      editProjectRequestsListStatus:
          editProjectRequestsListStatus ?? this.editProjectRequestsListStatus,
      editProjectRequestsList:
          editProjectRequestsList ?? this.editProjectRequestsList,
      publicProjectsList: publicProjectsList ?? this.publicProjectsList,
      publicProjectsListStatus:
          publicProjectsListStatus ?? this.publicProjectsListStatus,
      allProjectsList: allProjectsList ?? this.allProjectsList,
      allProjectsListStatus:
          allProjectsListStatus ?? this.allProjectsListStatus,
      pendedProjectList: pendedProjectList ?? this.pendedProjectList,
      pendedProjectListStatus:
          pendedProjectListStatus ?? this.pendedProjectListStatus,
      toDoProjectList: toDoProjectList ?? this.toDoProjectList,
      toDoProjectListStatus:
          toDoProjectListStatus ?? this.toDoProjectListStatus,
      inProgressProjectList:
          inProgressProjectList ?? this.inProgressProjectList,
      inProgressProjectListStatus:
          inProgressProjectListStatus ?? this.inProgressProjectListStatus,
      inReviewProjectList: inReviewProjectList ?? this.inReviewProjectList,
      inReviewProjectListStatus:
          inReviewProjectListStatus ?? this.inReviewProjectListStatus,
      completedProjectList: completedProjectList ?? this.completedProjectList,
      completedProjectListStatus:
          completedProjectListStatus ?? this.completedProjectListStatus,
      canceldProjectList: canceldProjectList ?? this.canceldProjectList,
      canceledProjectListStatus:
          canceledProjectListStatus ?? this.canceledProjectListStatus,
      userProjectsList: userProjectsList ?? this.userProjectsList,
      userProjectsListStatus:
          userProjectsListStatus ?? this.userProjectsListStatus,
      createTeamStatus: createTeamStatus ?? this.createTeamStatus,
      addMemersStatus: addMemersStatus ?? this.addMemersStatus,
      showTeamsStatus: showTeamsStatus ?? this.showTeamsStatus,
      showTeams: showTeams ?? this.showTeams,
      addTeamStatus: addTeamStatus ?? this.addTeamStatus,
    );
  }
}
