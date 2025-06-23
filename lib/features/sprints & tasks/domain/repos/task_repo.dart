import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

abstract class TaskRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> createTask(CreateOrUpdateTaskParam param);
  Future<Either<Failure, Unit>> updateTask(CreateOrUpdateTaskParam param);
  Future<Either<Failure, Unit>> deleteTask(TokenWithIdParam task);
  Future<Either<Failure, List<TaskEntity>>> showProjectTasks(
    TokenWithIdParam project,
  );
  Future<Either<Failure, List<TaskEntity>>> showSprintTasks(
    TokenWithIdParam sprint,
  );
  Future<Either<Failure, TaskEntity>> showTask(TokenWithIdParam task);
  Future<Either<Failure, List<TaskEntity>>> showEmployeeTasks(
    ShowEmployeeTasksParam param,
  );
  Future<Either<Failure, List<TaskEntity>>> showEmployeeProjectTasks(
    ShowEmployeeProjectTasksParam param,
  );
}
