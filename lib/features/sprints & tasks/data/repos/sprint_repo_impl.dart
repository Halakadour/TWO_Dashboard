import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/sprint_param.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/datasource/sprints_remote_datasource.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/sprint_repo.dart';

class SprintRepoImpl extends SprintRepo {
  SprintRepoImpl(this.sprintsRemoteDatasource);

  final SprintsRemoteDatasource sprintsRemoteDatasource;
  @override
  Future<Either<Failure, Unit>> createSprint(CreateOrUpdateSprintParam param) {
    return wrapHandling(
      tryCall: () async {
        sprintsRemoteDatasource.createSprint(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteSprint(TokenWithIdParam sprint) {
    return wrapHandling(
      tryCall: () async {
        sprintsRemoteDatasource.deleteSprint(sprint);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> showProjectSprints(TokenWithIdParam project) {
    return wrapHandling(
      tryCall: () async {
        await sprintsRemoteDatasource.showProjectSprints(project);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, SprintEntity>> showSprintDetails(
    TokenWithIdParam sprint,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await sprintsRemoteDatasource.showSprintDetails(sprint);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateSprint(CreateOrUpdateSprintParam param) {
    return wrapHandling(
      tryCall: () async {
        await sprintsRemoteDatasource.updateSprint(param);
        return Right(unit);
      },
    );
  }
}
