import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/repos/team_repo.dart';

class CreateTeamUsecase
    extends UseCase<Future<Either<Failure, TeamEntity>>, CreateTeamParam> {
  final TeamRepo teamRepo;

  CreateTeamUsecase(this.teamRepo);
  @override
  Future<Either<Failure, TeamEntity>> call(CreateTeamParam param) {
    return teamRepo.createTeam(
      param.token,
      param.name,
      param.mgrId,
      param.memebersIdList,
    );
  }
}

class CreateTeamParam {
  final String token;
  final String name;
  final int mgrId;
  final List<int> memebersIdList;

  CreateTeamParam({
    required this.token,
    required this.name,
    required this.mgrId,
    required this.memebersIdList,
  });
}
