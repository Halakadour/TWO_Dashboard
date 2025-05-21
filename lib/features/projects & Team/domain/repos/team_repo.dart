import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/team_entity.dart';

abstract class TeamRepo with HandlingExceptionManager {
  Future<Either<Failure, TeamEntity>> createTeam(
    String token,
    String name,
    int mgrId,
    List<int> memebersIdList,
  );
  Future<Either<Failure, TeamEntity>> addMembers(
    String token,
    int teamId,
    List<int> memebersIdList,
  );
  Future<Either<Failure, List<TeamEntity>>> showTeams();
}
