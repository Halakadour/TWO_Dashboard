import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/show_and_create_sprint_response_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/show_project_sprints_response_model.dart';

abstract class SprintRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> createSprint(
    String token,
    String lable,
    String description,
    String goal,
    String start,
    String end,
    int projectId,
    String status,
  );
  Future<Either<Failure, Unit>> updateSprint(
    String token,
    int sprintId,
    String lable,
    String description,
    String goal,
    String start,
    String end,
    int projectId,
    String status,
  );
  Future<Either<Failure, EmptyResponseModel>> deleteSprint(
    String token,
    int sprintId,
  );
  Future<Either<Failure, ShowProjectSprintsResponseModel>> showProjectSprints(
    String token,
    int projectId,
  );
  Future<Either<Failure, ShowAndCreateSprintResponseModel>> showSprintDetails(
    String token,
    int sprintId,
  );
}
