import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/features/projects%20&%20Team/data/datasource/team__remote_data_source.dart';
import 'package:two_dashboard/features/projects%20&%20Team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/projects%20&%20Team/domain/repos/team_repo.dart';

class TeamRepoImpl extends TeamRepo {
  final TeamRemoteDataSource teamRemoteDataSource;

  TeamRepoImpl(this.teamRemoteDataSource);
  @override
  Future<Either<Failure, TeamEntity>> addMembers(
    String token,
    int teamId,
    List<int> memebersIdList,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await teamRemoteDataSource.addMembers(
          token,
          teamId,
          memebersIdList,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, TeamEntity>> createTeam(
    String token,
    String name,
    int mgrId,
    List<int> memebersIdList,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await teamRemoteDataSource.createTeam(
          token,
          name,
          mgrId,
          memebersIdList,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<TeamEntity>>> showTeams() {
    return wrapHandling(
      tryCall: () async {
        final result = await teamRemoteDataSource.showTeams();
        return Right(result.data);
      },
    );
  }
}
