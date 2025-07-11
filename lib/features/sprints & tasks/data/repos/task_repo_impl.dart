import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/datasource/tasks_remote_datasource.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/sprint.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/task_repo.dart';

class TaskRepoImpl extends TaskRepo {
  TaskRepoImpl(this.taskRemoteDatasource);

  final TaskRemoteDatasource taskRemoteDatasource;
  @override
  Future<Either<Failure, Unit>> createTask(CreateOrUpdateTaskParam param) {
    return wrapHandling(
      tryCall: () async {
        await taskRemoteDatasource.createTask(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(TokenWithIdParam task) {
    return wrapHandling(
      tryCall: () async {
        await taskRemoteDatasource.deleteTask(task);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> showMySprintTasks(
    ShowMySprintTasksParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showMySprintTasks(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> showMyProjectTasks(
    ShowMyProjectTasksParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showMyProjectTasks(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> showSprintTasks(
    TokenWithIdParam sprint,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showSprintTasks(sprint);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, TaskEntity>> showTaskDetails(TokenWithIdParam task) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showTask(task);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateTask(CreateOrUpdateTaskParam param) {
    return wrapHandling(
      tryCall: () async {
        await taskRemoteDatasource.updateTask(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> createBacklogTasksSprint(
    CreateBacklogTasksSprintParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        await taskRemoteDatasource.createBacklogTasksSprint(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<Sprint>>> showPenedingSprintsTasks(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showPenedingSprintsTasks(
          project,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> showProjectBackLogTasks(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showProjectBackLogTasks(
          project,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<StatusModel>>> showProjectBoard(
    ShowProjectBoardParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showProjectBoard(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> showProjectTasks(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await taskRemoteDatasource.showProjectTasks(project);
        return Right(result.data);
      },
    );
  }
}
