import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/sprint.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

abstract class TaskRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> createTask(CreateOrUpdateTaskParam param);
  Future<Either<Failure, Unit>> updateTask(CreateOrUpdateTaskParam param);
  Future<Either<Failure, Unit>> deleteTask(TokenWithIdParam task);
  Future<Either<Failure, TaskEntity>> showTaskDetails(TokenWithIdParam task);
  Future<Either<Failure, List<TaskEntity>>> showProjectTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, List<TaskEntity>>> showSprintTasks(
    TokenWithIdParam sprint,
  );
  Future<Either<Failure, List<TaskEntity>>> showMyProjectTasks(
    ShowMyProjectTasksParam param,
  );
  Future<Either<Failure, List<TaskEntity>>> showMySprintTasks(
    ShowMySprintTasksParam param,
  );

  Future<Either<Failure, List<StatusModel>>> showProjectBoard(
    ShowProjectBoardParam param,
  );
  Future<Either<Failure, List<Sprint>>> showPenedingSprintsTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, List<TaskEntity>>> showProjectBackLogTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, Unit>> createBacklogTasksSprint(
    CreateBacklogTasksSprintParam param,
  );
}
