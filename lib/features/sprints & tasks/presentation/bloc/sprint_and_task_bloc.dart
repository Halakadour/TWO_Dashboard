import 'package:bloc/bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/sprint_param.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/create_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/delete_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/show_project_sprints_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/show_sprint_details_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/sprint-usecase/update_sprint_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/create_task_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/delete_task_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_my_project_tasks_usecase.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/usecases/task-usecase/show_my_sprint_tasks_usecase.dart';
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
  final ShowProjectSprintsUsecase showProjectSprintsUsecase;
  final ShowSprintDetailsUsecase showSprintDetailsUsecase;
  // Task Use cases
  final CreateTaskUsecase createTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final ShowSprintTasksUsecase showSprintTasksUsecase;
  final ShowTaskDetailsUsecase showTaskDetailsUsecase;
  final ShowMyProjectTasksUsecase showMyProjectTasksUsecase;
  final ShowMySprintTasksUsecase showMySprintTasksUsecase;
  SprintAndTaskBloc(
    this.createSprintUsecase,
    this.updateSprintUsecase,
    this.deleteSprintUsecase,
    this.showProjectSprintsUsecase,
    this.showSprintDetailsUsecase,
    this.createTaskUsecase,
    this.updateTaskUsecase,
    this.deleteTaskUsecase,
    this.showSprintTasksUsecase,
    this.showTaskDetailsUsecase,
    this.showMyProjectTasksUsecase,
    this.showMySprintTasksUsecase,
  ) : super(SprintAndTaskState()) {
    // ** SPRINT BLOC ** //
    on<CreateSprintEvent>((event, emit) async {
      emit(state.copyWith(createSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await createSprintUsecase.call(
          CreateOrUpdateSprintParam(
            token: token,
            sprintId: event.param.sprintId,
            lable: event.param.lable,
            description: event.param.description,
            goal: event.param.goal,
            start: event.param.start,
            end: event.param.end,
            projectId: event.param.projectId,
            status: event.param.status,
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
    on<UpdateSprintEvent>((event, emit) async {
      emit(state.copyWith(updateSprintStatus: CasualStatus.loading));
      final token = await SharedPreferencesServices.getUserToken();
      if (token != null) {
        final result = await updateSprintUsecase.call(
          CreateOrUpdateSprintParam(
            token: token,
            sprintId: event.param.sprintId,
            lable: event.param.lable,
            description: event.param.description,
            goal: event.param.goal,
            start: event.param.start,
            end: event.param.end,
            projectId: event.param.projectId,
            status: event.param.status,
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
          CreateOrUpdateTaskParam(
            token: token,
            title: event.param.title,
            description: event.param.description,
            projectId: event.param.projectId,
            sprintId: event.param.sprintId,
            statusId: event.param.statusId,
            userId: event.param.userId,
            priority: event.param.priority,
            completion: event.param.completion,
            startDate: event.param.startDate,
            endDate: event.param.endDate,
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
          CreateOrUpdateTaskParam(
            token: token,
            taskId: event.param.taskId,
            title: event.param.title,
            description: event.param.description,
            projectId: event.param.projectId,
            sprintId: event.param.sprintId,
            statusId: event.param.statusId,
            userId: event.param.userId,
            priority: event.param.priority,
            completion: event.param.completion,
            startDate: event.param.startDate,
            endDate: event.param.endDate,
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
  }
}
