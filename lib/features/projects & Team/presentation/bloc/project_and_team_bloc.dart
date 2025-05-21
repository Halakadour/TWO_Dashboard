import 'package:bloc/bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/project/create_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/project/delete_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/project/show_all_projects_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/project/show_public_projects_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/project/show_user_projects_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/team/add_members_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/team/create_team_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/usecases/team/show_teams_usecase.dart';

part 'project_and_team_event.dart';
part 'project_and_team_state.dart';

class ProjectAndTeamBloc
    extends Bloc<ProjectAndTeamEvent, ProjectAndTeamState> {
  // Project UseCase
  final CreateProjectUsecase createProjectUsecase;
  final DeleteProjectUsecase deleteProjectUsecase;
  final ShowAllProjectsUsecase showAllProjectsUsecase;
  final ShowPublicProjectsUsecase showPublicProjectsUsecase;
  final ShowUserProjectsUsecase showUserProjectsUsecase;
  // Task Usecase
  final CreateTeamUsecase createTeamUsecase;
  final AddMembersUsecase addMembersUsecase;
  final ShowTeamsUsecase showTeamsUsecase;

  ProjectAndTeamBloc(
    this.createProjectUsecase,
    this.deleteProjectUsecase,
    this.showAllProjectsUsecase,
    this.showPublicProjectsUsecase,
    this.showUserProjectsUsecase,
    this.createTeamUsecase,
    this.addMembersUsecase,
    this.showTeamsUsecase,
  ) : super(ProjectAndTeamState()) {
    // Project Bloc //
    on<CreateProjectEvent>((event, emit) async {
      emit(state.copyWith(createProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createProjectUsecase.call(
          CreateProjectParam(
            name: event.name,
            token: token,
            description: event.description,
            contractId: event.contractId,
            teamId: event.teamId,
            startDate: event.startDate,
            endDate: event.endDate,
            private: event.private,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createProjectStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) =>
              emit(state.copyWith(createProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createProjectStatus: CasualStatus.notAuthorized));
      }
    });
    on<DeleteProjectsEvent>((event, emit) async {
      emit(state.copyWith(deleteProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deleteProjectUsecase.call(
          DeleteProjectParam(token: token, projectId: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              deleteProjectStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) =>
              emit(state.copyWith(deleteProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deleteProjectStatus: CasualStatus.notAuthorized));
      }
    });
    on<ShowAllProjectsEvent>((event, emit) async {
      emit(state.copyWith(allProjectsListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showAllProjectsUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              allProjectsListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              allProjectsListStatus: CasualStatus.success,
              allProjectsList: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(allProjectsListStatus: CasualStatus.notAuthorized));
      }
    });
    on<ShowPublicProjectsEvent>((event, emit) async {
      emit(state.copyWith(publicProjectsListStatus: CasualStatus.loading));
      final result = await showPublicProjectsUsecase.call();
      result.fold(
        (l) => emit(
          state.copyWith(
            publicProjectsListStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            publicProjectsListStatus: CasualStatus.success,
            publicProjectsList: r,
          ),
        ),
      );
    });
    on<ShowUserProjectsEvent>((event, emit) async {
      emit(state.copyWith(userProjectsListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showUserProjectsUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              userProjectsListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              userProjectsListStatus: CasualStatus.success,
              userProjectsList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(userProjectsListStatus: CasualStatus.notAuthorized),
        );
      }
    });
    // Team Bloc //
    on<CreateTeamEvent>((event, emit) async {
      emit(state.copyWith(createTeamStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createTeamUsecase.call(
          CreateTeamParam(
            token: token,
            name: event.name,
            mgrId: event.mgrId,
            memebersIdList: event.memebersIdList,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createTeamStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(createTeamStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createTeamStatus: CasualStatus.notAuthorized));
      }
    });
    on<AddMembersEvent>((event, emit) async {
      emit(state.copyWith(addMemersStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await addMembersUsecase.call(
          AddMembersParam(
            token: token,
            teamId: event.teamId,
            memebersIdList: event.memebersIdList,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              addMemersStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(addMemersStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(addMemersStatus: CasualStatus.notAuthorized));
      }
    });
    on<ShowTeamsEvent>((event, emit) async {
      emit(state.copyWith(showTeamsStatus: CasualStatus.loading));
      final result = await showTeamsUsecase.call();
      result.fold(
        (l) => emit(
          state.copyWith(
            showTeamsStatus: CasualStatus.failure,
            message: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(showTeamsStatus: CasualStatus.success, showTeams: r),
        ),
      );
    });
  }
}
