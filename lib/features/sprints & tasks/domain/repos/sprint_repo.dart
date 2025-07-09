import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/sprint_param.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';

abstract class SprintRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> createSprint(CreateOrUpdateSprintParam param);
  Future<Either<Failure, Unit>> updateSprint(CreateOrUpdateSprintParam param);
  Future<Either<Failure, Unit>> deleteSprint(TokenWithIdParam sprint);
  // Future<Either<Failure, List<SprintEntity>>> showProjectSprints(
  //   TokenWithIdParam project,
  // );
  Future<Either<Failure, Unit>> showProjectSprints(TokenWithIdParam project);
  Future<Either<Failure, SprintEntity>> showSprintDetails(
    TokenWithIdParam sprint,
  );
}
