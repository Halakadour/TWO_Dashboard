part of 'project_and_team_bloc.dart';

class ProjectAndTeamState {
  final int? statusNum;
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
  // Public & Private Project List
  final List<ProjectEntity> publicProjectsList;
  final CasualStatus publicProjectsListStatus;
  final List<ProjectEntity> allProjectsList;
  final CasualStatus allProjectsListStatus;
  // Pended Project Lists
  final List<ProjectEntity> pendedProjectList;
  final CasualStatus pendedProjectListStatus;
  // My Project List
  final List<ProjectEntity> userProjectsList;
  final CasualStatus userProjectsListStatus;
  // Status State
  final CasualStatus createStatus;
  final CasualStatus deleteStatus;
  final CasualStatus updateOrderStatus;
  final CasualStatus showStatus;
  final List<StatusModel> showStatusList;
  // Team State
  final CasualStatus createTeamStatus;
  final CasualStatus addMemersStatus;
  final CasualStatus showTeamsStatus;
  final List<TeamEntity> showTeams;
  final CasualStatus addTeamStatus;

  ProjectAndTeamState({
    this.statusNum,
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
    this.pendedProjectList = const [],
    this.pendedProjectListStatus = CasualStatus.initial,
    this.userProjectsList = const [],
    this.userProjectsListStatus = CasualStatus.initial,
    this.createStatus = CasualStatus.initial,
    this.deleteStatus = CasualStatus.initial,
    this.updateOrderStatus = CasualStatus.initial,
    this.showStatusList = const [],
    this.showStatus = CasualStatus.initial,
    this.createTeamStatus = CasualStatus.initial,
    this.addMemersStatus = CasualStatus.initial,
    this.showTeamsStatus = CasualStatus.initial,
    this.showTeams = const [],
    this.addTeamStatus = CasualStatus.initial,
  });

  ProjectAndTeamState copyWith({
    int? statusNum,
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
    List<ProjectEntity>? userProjectsList,
    CasualStatus? userProjectsListStatus,
    CasualStatus? createStatus,
    CasualStatus? deleteStatus,
    CasualStatus? updateOrderStatus,
    CasualStatus? showStatus,
    List<StatusModel>? showStatusList,
    CasualStatus? createTeamStatus,
    CasualStatus? addMemersStatus,
    CasualStatus? showTeamsStatus,
    List<TeamEntity>? showTeams,
    CasualStatus? addTeamStatus,
  }) {
    return ProjectAndTeamState(
      statusNum: statusNum ?? this.statusNum,
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
      userProjectsList: userProjectsList ?? this.userProjectsList,
      userProjectsListStatus:
          userProjectsListStatus ?? this.userProjectsListStatus,
      createStatus: createStatus ?? this.createStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      updateOrderStatus: updateOrderStatus ?? this.updateOrderStatus,
      showStatus: showStatus ?? this.showStatus,
      showStatusList: showStatusList ?? this.showStatusList,
      createTeamStatus: createTeamStatus ?? this.createTeamStatus,
      addMemersStatus: addMemersStatus ?? this.addMemersStatus,
      showTeamsStatus: showTeamsStatus ?? this.showTeamsStatus,
      showTeams: showTeams ?? this.showTeams,
      addTeamStatus: addTeamStatus ?? this.addTeamStatus,
    );
  }
}
