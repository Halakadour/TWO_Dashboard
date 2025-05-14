// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'project_and_task_bloc.dart';

class ProjectAndTaskState {
  final String message;
  // Project State
  final CasualStatus createProjectStatus;
  final CasualStatus updateProjectStatus;
  final CasualStatus deleteProjectStatus;
  final List<ProjectEntity> publicProjectsList;
  final CasualStatus publicProjectsListStatus;
  final List<ProjectEntity> allProjectsList;
  final CasualStatus allProjectsListStatus;
  final List<ProjectEntity> userProjectsList;
  final CasualStatus userProjectsListStatus;
  // Task State
  final CasualStatus createTeamStatus;
  final CasualStatus addMemersStatus;
  final CasualStatus showTeamsStatus;
  final List<TeamEntity> showTeams;

  ProjectAndTaskState({
    this.message = "",
    this.createProjectStatus = CasualStatus.initial,
    this.updateProjectStatus = CasualStatus.initial,
    this.deleteProjectStatus = CasualStatus.initial,
    this.publicProjectsList = const [],
    this.publicProjectsListStatus = CasualStatus.initial,
    this.allProjectsList = const [],
    this.allProjectsListStatus = CasualStatus.initial,
    this.userProjectsList = const [],
    this.userProjectsListStatus = CasualStatus.initial,
    this.createTeamStatus = CasualStatus.initial,
    this.addMemersStatus = CasualStatus.initial,
    this.showTeamsStatus = CasualStatus.initial,
    this.showTeams = const [],
  });

  ProjectAndTaskState copyWith({
    String? message,
    CasualStatus? createProjectStatus,
    CasualStatus? updateProjectStatus,
    CasualStatus? deleteProjectStatus,
    List<ProjectEntity>? publicProjectsList,
    CasualStatus? publicProjectsListStatus,
    List<ProjectEntity>? allProjectsList,
    CasualStatus? allProjectsListStatus,
    List<ProjectEntity>? userProjectsList,
    CasualStatus? userProjectsListStatus,
    CasualStatus? createTeamStatus,
    CasualStatus? addMemersStatus,
    CasualStatus? showTeamsStatus,
    List<TeamEntity>? showTeams,
  }) {
    return ProjectAndTaskState(
      message: message ?? this.message,
      createProjectStatus: createProjectStatus ?? this.createProjectStatus,
      updateProjectStatus: updateProjectStatus ?? this.updateProjectStatus,
      deleteProjectStatus: deleteProjectStatus ?? this.deleteProjectStatus,
      publicProjectsList: publicProjectsList ?? this.publicProjectsList,
      publicProjectsListStatus:
          publicProjectsListStatus ?? this.publicProjectsListStatus,
      allProjectsList: allProjectsList ?? this.allProjectsList,
      allProjectsListStatus:
          allProjectsListStatus ?? this.allProjectsListStatus,
      userProjectsList: userProjectsList ?? this.userProjectsList,
      userProjectsListStatus:
          userProjectsListStatus ?? this.userProjectsListStatus,
      createTeamStatus: createTeamStatus ?? this.createTeamStatus,
      addMemersStatus: addMemersStatus ?? this.addMemersStatus,
      showTeamsStatus: showTeamsStatus ?? this.showTeamsStatus,
      showTeams: showTeams ?? this.showTeams,
    );
  }
}
