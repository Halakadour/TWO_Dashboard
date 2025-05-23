import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/repos/team_repo.dart';

class AddMembersUsecase
    extends UseCase<Future<Either<Failure, TeamEntity>>, AddMembersParam> {
  final TeamRepo teamRepo;

  AddMembersUsecase(this.teamRepo);

  @override
  Future<Either<Failure, TeamEntity>> call(AddMembersParam param) {
    return teamRepo.addMembers(param.token, param.teamId, param.memebersIdList);
  }
}

class AddMembersParam {
  final String token;
  final int teamId;
  final List<int> memebersIdList;

  AddMembersParam({
    required this.token,
    required this.teamId,
    required this.memebersIdList,
  });
}
