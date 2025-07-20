import 'package:bloc/bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/sprint_param.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/sprint.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/complete_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/create_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/delete_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/show_project_sprints_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/show_project_started_sprints_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/show_project_un_complete_sprints_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/show_sprint_details_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/start_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/update_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/create_backlog_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/create_task_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/delete_task_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_my_project_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_my_sprint_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_pending_sprint_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_project_backlog_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_project_board_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_project_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_sprint_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_task_details_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/update_task_usecase.dart';

part 'sprint_and_task_event.dart';
part 'sprint_and_task_state.dart';

class SprintAndTaskBloc extends Bloc<SprintAndTaskEvent, SprintAndTaskState> {
  // Sprint Use cases
  final CreateSprintUsecase createSprintUsecase;
  final UpdateSprintUsecase updateSprintUsecase;
  final DeleteSprintUsecase deleteSprintUsecase;
  final StartSprintUsecase startSprintUsecase;
  final CompleteSprintUsecase completeSprintUsecase;
  final ShowProjectUnCompleteSprintsUsecase showProjectUnCompleteSprintsUsecase;
  final ShowProjectStartedSprintsUsecase showProjectStartedSprintsUsecase;
  final ShowProjectSprintsUsecase showProjectSprintsUsecase;
  final ShowSprintDetailsUsecase showSprintDetailsUsecase;
  // Task Use cases
  final CreateTaskUsecase createTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final ShowTaskDetailsUsecase showTaskDetailsUsecase;
  final ShowProjectTasksUsecase showProjectTasksUsecase;
  final ShowSprintTasksUsecase showSprintTasksUsecase;
  final ShowMyProjectTasksUsecase showMyProjectTasksUsecase;
  final ShowMySprintTasksUsecase showMySprintTasksUsecase;
  final ShowProjectBoardUsecase showProjectBoardUsecase;
  final ShowPendingSprintTasksUsecase showPendingSprintTasksUsecase;
  final ShowProjectBacklogTasksUsecase showProjectBacklogTasksUsecase;
  final CreateBacklogTasksUsecase createBacklogTasksUsecase;
  SprintAndTaskBloc(
    this.createSprintUsecase,
    this.updateSprintUsecase,
    this.deleteSprintUsecase,
    this.startSprintUsecase,
    this.completeSprintUsecase,
    this.showProjectUnCompleteSprintsUsecase,
    this.showProjectStartedSprintsUsecase,
    this.showProjectSprintsUsecase,
    this.showSprintDetailsUsecase,
    this.createTaskUsecase,
    this.updateTaskUsecase,
    this.deleteTaskUsecase,
    this.showTaskDetailsUsecase,
    this.showProjectTasksUsecase,
    this.showSprintTasksUsecase,
    this.showMyProjectTasksUsecase,
    this.showMySprintTasksUsecase,
    this.showProjectBoardUsecase,
    this.showPendingSprintTasksUsecase,
    this.showProjectBacklogTasksUsecase,
    this.createBacklogTasksUsecase,
  ) : super(SprintAndTaskState()) {
    // ** SPRINT BLOC ** //
    // create sprint
    on<CreateSprintEvent>((event, emit) async {
      emit(state.copyWith(createSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createSprintUsecase.call(
          CreateSprintParam(
            token: token,
            lable: event.lable,
            description: event.description,
            goal: event.goal,
            start: event.start,
            end: event.end,
            projectId: event.projectId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createSprintStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(createSprintStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createSprintStatus: CasualStatus.not_authorized));
      }
    });
    // Update sprint
    on<UpdateSprintEvent>((event, emit) async {
      emit(state.copyWith(updateSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateSprintUsecase.call(
          UpdateSprintParam(
            token: token,
            sprintId: event.sprintId,
            lable: event.lable,
            description: event.description,
            goal: event.goal,
            start: event.start,
            end: event.end,
            projectId: event.projectId,
            status: event.status,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              updateSprintStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(updateSprintStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(updateSprintStatus: CasualStatus.not_authorized));
      }
    });
    // Delete Sprint
    on<DeleteSprintEvent>((event, emit) async {
      emit(state.copyWith(deleteSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deleteSprintUsecase.call(
          TokenWithIdParam(token: token, id: event.sprintId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              deleteSprintStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(deleteSprintStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deleteSprintStatus: CasualStatus.not_authorized));
      }
    });
    // Start Sprint
    on<StartSprintEvent>((event, emit) async {
      emit(state.copyWith(startSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await startSprintUsecase.call(
          StartSprintParam(
            token: token,
            projectId: event.projectId,
            sprintId: event.sprintId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              startSprintStatus: CasualStatus.failure,
              errorMessage: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(state.copyWith(startSprintStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(startSprintStatus: CasualStatus.not_authorized));
      }
    });
    // Complete Sprint
    on<CompleteSprintEvent>((event, emit) async {
      emit(state.copyWith(completeSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await completeSprintUsecase.call(
          CompleteSprintParam(
            token: token,
            projectId: event.projectId,
            sprintId: event.sprintId,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              completeSprintStatus: CasualStatus.failure,
              errorMessage: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) =>
              emit(state.copyWith(completeSprintStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(completeSprintStatus: CasualStatus.not_authorized));
      }
    });
    // Show Project Un Complete Sprints
    on<ShowProjectUnCompleteSprintEvent>((event, emit) async {
      emit(
        state.copyWith(
          projectUnCompleteSprintsListStatus: CasualStatus.loading,
        ),
      );
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectUnCompleteSprintsUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              projectUnCompleteSprintsListStatus: CasualStatus.failure,
              errorMessage: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(
            state.copyWith(
              projectUnCompleteSprintsListStatus: CasualStatus.success,
              projectUnCompleteSprintsList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            projectUnCompleteSprintsListStatus: CasualStatus.not_authorized,
          ),
        );
      }
    });
    // Show Project Started Sprints
    on<ShowProjectStartedSprintEvent>((event, emit) async {
      emit(
        state.copyWith(projectStartedSprintsListStatus: CasualStatus.loading),
      );
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectStartedSprintsUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              projectStartedSprintsListStatus: CasualStatus.failure,
              errorMessage: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(
            state.copyWith(
              projectStartedSprintsListStatus: CasualStatus.success,
              projectStartedSprintsList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            projectStartedSprintsListStatus: CasualStatus.not_authorized,
          ),
        );
      }
    });
    // Show Project Sprints
    on<ShowProjectSprintsEvent>((event, emit) async {
      emit(state.copyWith(projectSprintsListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectSprintsUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              projectSprintsListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              projectSprintsListStatus: CasualStatus.success,
              projectSprintsList: [],
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(projectSprintsListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // Show Sprint Details
    on<ShowSprintDetailsEvent>((event, emit) async {
      emit(state.copyWith(sprintEntityStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showSprintDetailsUsecase.call(
          TokenWithIdParam(token: token, id: event.sprintId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              sprintEntityStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              sprintEntityStatus: CasualStatus.success,
              sprintEntity: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(sprintEntityStatus: CasualStatus.not_authorized));
      }
    });
    // ** TASK BLOC ** //
    // Create Task
    on<CreateTaskEvent>((event, emit) async {
      emit(state.copyWith(createTaskStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createTaskUsecase.call(
          CreateTaskParam(
            token: token,
            title: event.title,
            description: event.description,
            projectId: event.projectId,
            sprintId: event.sprintId,
            statusId: event.statusId,
            userId: event.userId,
            priority: event.priority,
            completion: event.completion,
            startDate: event.startDate,
            endDate: event.endDate,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createTaskStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(createTaskStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(createTaskStatus: CasualStatus.not_authorized));
      }
    });
    // Update Task
    on<UpdateTaskEvent>((event, emit) async {
      emit(state.copyWith(updateTaskStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateTaskUsecase.call(
          UpdateTaskParam(
            token: token,
            taskId: event.taskId,
            title: event.title,
            description: event.description,
            projectId: event.projectId,
            sprintId: event.sprintId,
            statusId: event.statusId,
            userId: event.userId,
            priority: event.priority,
            completion: event.completion,
            startDate: event.startDate,
            endDate: event.endDate,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              updateTaskStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(updateTaskStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(updateTaskStatus: CasualStatus.not_authorized));
      }
    });
    // Delete Task
    on<DeleteTaskEvent>((event, emit) async {
      emit(state.copyWith(deleteTaskStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await deleteTaskUsecase.call(
          TokenWithIdParam(token: token, id: event.taskId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              deleteTaskStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(state.copyWith(deleteTaskStatus: CasualStatus.success)),
        );
      } else {
        emit(state.copyWith(deleteTaskStatus: CasualStatus.not_authorized));
      }
    });
    // View Task Details
    on<ShowTaskDetailsEvent>((event, emit) async {
      emit(state.copyWith(taskEntityStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showTaskDetailsUsecase.call(
          TokenWithIdParam(token: token, id: event.taskId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              taskEntityStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              taskEntityStatus: CasualStatus.success,
              taskEntity: r,
            ),
          ),
        );
      } else {
        emit(state.copyWith(taskEntityStatus: CasualStatus.not_authorized));
      }
    });
    // View Tasks On This Project
    on<ShowProjectTasksEvent>((event, emit) async {
      emit(state.copyWith(projectTasksListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectTasksUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              projectTasksListStatus: CasualStatus.failure,
              errorMessage: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(
            state.copyWith(
              projectTasksListStatus: CasualStatus.success,
              projectTasksList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(projectTasksListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // View Tasks On This Sprint
    on<ShowSprintTasksEvent>((event, emit) async {
      emit(state.copyWith(sprintTasksListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showSprintTasksUsecase.call(
          TokenWithIdParam(token: token, id: event.sprintId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              sprintTasksListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              sprintTasksListStatus: CasualStatus.success,
              sprintTasksList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(sprintTasksListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // View My Tasks on This Project
    on<ShowMyProjectTasksEvent>((event, emit) async {
      emit(state.copyWith(myProjectTasksListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showMyProjectTasksUsecase.call(
          ShowMyProjectTasksParam(
            token: token,
            projectId: event.projectId,
            proirity: event.proirity,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              myProjectTasksListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              myProjectTasksListStatus: CasualStatus.success,
              myProjectTasksList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(myProjectTasksListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // View My Tasks on This Sprint
    on<ShowMySprintTasksEvent>((event, emit) async {
      emit(state.copyWith(mySprintTasksListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showMySprintTasksUsecase.call(
          ShowMySprintTasksParam(
            token: token,
            projectId: event.projectId,
            sprinttId: event.sprinttId,
            proirity: event.proirity,
            status: event.status,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              mySprintTasksListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              mySprintTasksListStatus: CasualStatus.success,
              mySprintTasksList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(mySprintTasksListStatus: CasualStatus.not_authorized),
        );
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
              errorMessage: l.message,
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
    // View Tasks In The Pended Sprint
    on<ShowPendedSprintTasksEvent>((event, emit) async {
      emit(state.copyWith(pendedSprintTasksListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showPendingSprintTasksUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              pendedSprintTasksListStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              pendedSprintTasksListStatus: CasualStatus.success,
              pendedSprintTasksList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            pendedSprintTasksListStatus: CasualStatus.not_authorized,
          ),
        );
      }
    });
    // View Backlog Tasks in This Project
    on<ShowProjectBacklogTasksEvent>((event, emit) async {
      emit(state.copyWith(backlogTasksListStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await showProjectBacklogTasksUsecase.call(
          TokenWithIdParam(token: token, id: event.projectId),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              backlogTasksListStatus: CasualStatus.failure,
              errorMessage: l.message,
              statusNum: l.hashCode,
            ),
          ),
          (r) => emit(
            state.copyWith(
              backlogTasksListStatus: CasualStatus.success,
              backlogTasksList: r,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(backlogTasksListStatus: CasualStatus.not_authorized),
        );
      }
    });
    // Create Backlog Tasks Sprint
    on<CreateBacklogTasksSprintEvent>((event, emit) async {
      emit(
        state.copyWith(createBacklogTasksSprintStatus: CasualStatus.loading),
      );
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createBacklogTasksUsecase.call(
          CreateBacklogTasksSprintParam(
            token: token,
            projectId: event.projectId,
            label: event.label,
            description: event.description,
            goal: event.goal,
            startDate: event.startDate,
            endDate: event.endDate,
            tasksIds: event.tasksIds,
          ),
        );
        result.fold(
          (l) => emit(
            state.copyWith(
              createBacklogTasksSprintStatus: CasualStatus.failure,
              errorMessage: l.message,
            ),
          ),
          (r) => emit(
            state.copyWith(
              createBacklogTasksSprintStatus: CasualStatus.success,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            createBacklogTasksSprintStatus: CasualStatus.not_authorized,
          ),
        );
      }
    });
  }
}
