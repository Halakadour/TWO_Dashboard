import 'package:bloc/bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/project_param.dart';
import 'package:two_dashboard/core/param/status_param.dart';
import 'package:two_dashboard/core/param/team_param.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/show_project_edit_request_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/approved_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/create_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/delete_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/reject_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/sent_edit_project_message_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/show_all_projects_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/show_pended_project_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/show_project_edit_request_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/show_public_projects_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/project/show_user_projects_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/status/create_status_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/status/delete_status_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/status/show_project_board_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/status/show_status_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/status/update_status_order_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/team/add_members_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/team/add_team_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/team/create_team_usecase.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/usecases/team/show_teams_usecase.dart';

part 'project_status_team_event.dart';
part 'project_status_team_state.dart';

class ProjectStatusTeamBloc
    extends Bloc<ProjectStatusTeamEvent, ProjectStatusTeamState> {
  // Project UseCase
  final CreateProjectUsecase createProjectUsecase;
  final DeleteProjectUsecase deleteProjectUsecase;
  final ApproveProjectUsecase approvedProjectUsecase;
  final RejectProjectUsecase rejectProjectUsecase;
  final SentEditProjectMessageUsecase sentEditProjectMessageUsecase;
  final ShowProjectEditRequestUsecase showProjectEditRequestUsecase;
  final ShowAllProjectsUsecase showAllProjectsUsecase;
  final ShowPendedProjectUsecase showPendedProjectUsecase;
  final ShowPublicProjectsUsecase showPublicProjectsUsecase;
  final ShowUserProjectsUsecase showUserProjectsUsecase;
  // Status Usecase
  final CreateStatusUsecase createStatusUsecase;
  final DeleteStatusUsecase deleteStatusUsecase;
  final UpdateStatusOrderUsecase updateStatusOrderUsecase;
  final ShowStatusUsecase showStatusUsecase;
  final ShowProjectBoardUsecase showProjectBoardUsecase;
  // Team Usecase
  final CreateTeamUsecase createTeamUsecase;
  final AddMembersUsecase addMembersUsecase;
  final ShowTeamsUsecase showTeamsUsecase;
  final AddTeamUsecase addTeamUsecase;

  ProjectStatusTeamBloc(
    this.createProjectUsecase,
    this.deleteProjectUsecase,
    this.approvedProjectUsecase,
    this.rejectProjectUsecase,
    this.sentEditProjectMessageUsecase,
    this.showProjectEditRequestUsecase,
    this.showAllProjectsUsecase,
    this.showPendedProjectUsecase,
    this.showPublicProjectsUsecase,
    this.showUserProjectsUsecase,
    this.createStatusUsecase,
    this.deleteStatusUsecase,
    this.updateStatusOrderUsecase,
    this.showStatusUsecase,
    this.showProjectBoardUsecase,
    this.createTeamUsecase,
    this.addMembersUsecase,
    this.showTeamsUsecase,
    this.addTeamUsecase,
  ) : super(ProjectStatusTeamState()) {
    // *** PROJECT SIDE *** //
    // Create Project
    on<CreateProjectEvent>((event, emit) async {
      emit(state.copyWith(createProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createProjectUsecase.call(event.param);
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
        emit(state.copyWith(createProjectStatus: CasualStatus.not_authorized));
      }
    });
    // Delete Project
    on<DeleteProjectsEvent>((event, emit) async {
      emit(state.copyWith(deleteProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deleteProjectUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
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
        emit(state.copyWith(deleteProjectStatus: CasualStatus.not_authorized));
      }
    });
    // Approve project
    on<ApproveProjectsEvent>((event, emit) async {
      emit(state.copyWith(approveProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await approvedProjectUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              approveProjectStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) =>
              emit(state.copyWith(approveProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(approveProjectStatus: CasualStatus.not_authorized));
      }
    });
    // Reject Project
    on<RejectProjectsEvent>((event, emit) async {
      emit(state.copyWith(rejectProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await rejectProjectUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              rejectProjectStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) =>
              emit(state.copyWith(rejectProjectStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(rejectProjectStatus: CasualStatus.not_authorized));
      }
    });
    // Sent Edit Project Message
    on<SentEditProjectMessageEvent>((event, emit) async {
      emit(state.copyWith(editRequestProjectStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await sentEditProjectMessageUsecase.call(
          EditProjectRequestParam(
            token: token,
            projectId: event.projectId,
            message: event.message,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              editRequestProjectStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(editRequestProjectStatus: CasualStatus.success),
          ),
        );
      } else {
        emit(
          state.copyWith(editRequestProjectStatus: CasualStatus.not_authorized),
        );
      }
    });
    // Show Edit Project Request Messages
    on<ShowEditProjectRequestEvent>((event, emit) async {
      emit(state.copyWith(editProjectRequestsListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectEditRequestUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              editProjectRequestsListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              editProjectRequestsListStatus: CasualStatus.success,
              editProjectRequestsList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            editProjectRequestsListStatus: CasualStatus.not_authorized,
          ),
        );
      }
    });
    // Show All Projects
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
        emit(
          state.copyWith(allProjectsListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // Show Pended Projects
    on<ShowPendedProjectsEvent>((event, emit) async {
      emit(state.copyWith(pendedProjectListStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showPendedProjectUsecase.call(token);
        result.fold(
          (l) => emit(
            state.copyWith(
              pendedProjectListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              pendedProjectListStatus: CasualStatus.success,
              pendedProjectList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(pendedProjectListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // Show Public Project
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
    // Show User Projects
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
          state.copyWith(userProjectsListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // ** STATUS SIDE ** //
    // Create Status
    on<CreateStatusEvent>((event, emit) async {
      emit(state.copyWith(createStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createStatusUsecase.call(
          CreateStatusParam(
            projectId: event.projectId,
            name: event.statusName,
            token: token,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createStatus: CasualStatus.failure,
              message: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(state.copyWith(createStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createStatus: CasualStatus.not_authorized));
      }
    });
    // Delete Status
    on<DeleteStatusEvent>((event, emit) async {
      emit(state.copyWith(deleteStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deleteStatusUsecase.call(
          DeleteStatusParam(
            token: token,
            projectId: event.projectId,
            statusId: event.statusId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              deleteStatus: CasualStatus.failure,
              message: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(state.copyWith(deleteStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deleteStatus: CasualStatus.not_authorized));
      }
    });
    // Update Status Order
    on<UpdateStatusOrderEvent>((event, emit) async {
      emit(state.copyWith(updateOrderStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateStatusOrderUsecase.call(
          UpdateStatusOrderParam(
            token: token,
            projectId: event.projectId,
            statusId: event.statusId,
            newOrder: event.newOrder,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              updateOrderStatus: CasualStatus.failure,
              message: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(state.copyWith(updateOrderStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(updateOrderStatus: CasualStatus.not_authorized));
      }
    });
    // Show Project Status
    on<ShowProjectStatusEvent>((event, emit) async {
      emit(state.copyWith(showStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showStatusUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              showStatus: CasualStatus.failure,
              message: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(
            state.copyWith(showStatus: CasualStatus.success, showStatusList: r),
          ),
        );
      } else {
        emit(state.copyWith(showStatus: CasualStatus.not_authorized));
      }
    });
    // View The Project Board
    on<ShowProjectBoardEvent>((event, emit) async {
      emit(state.copyWith(projectBoardListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectBoardUsecase.call(
          ShowProjectBoardParam(
            token: token,
            projectId: event.projectId,
            sprintsIdList: event.sprintsIdList,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              projectBoardListStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              projectBoardListStatus: CasualStatus.success,
              projectBoardList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(projectBoardListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // *** TEAM SIDE *** //
    // Create Team
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
        emit(state.copyWith(createTeamStatus: CasualStatus.not_authorized));
      }
    });
    // Add New Memder
    on<AddMembersEvent>((event, emit) async {
      emit(state.copyWith(addMemersStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await addMembersUsecase.call(
          AddTeamMembersParam(
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
        emit(state.copyWith(addMemersStatus: CasualStatus.not_authorized));
      }
    });
    // Show Team
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
    // add Project Team
    on<AddProjectTeamEvent>((event, emit) async {
      emit(state.copyWith(addTeamStatus: CasualStatus.loading));
      final String? token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await addTeamUsecase.call(
          AddTeamParam(
            token: token,
            projectId: event.projectId,
            teamId: event.teamId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              addTeamStatus: CasualStatus.failure,
              message: l.message,
            ),
          ),
          (r) => emit(state.copyWith(addTeamStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(addTeamStatus: CasualStatus.not_authorized));
      }
    });
  }
}
