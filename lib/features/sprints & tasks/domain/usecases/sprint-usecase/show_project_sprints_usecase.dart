import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/sprint_repo.dart';

class ShowProjectSprintsUsecase
    extends UseCase<Future<Either<Failure, Unit>>, TokenWithIdParam> {
  ShowProjectSprintsUsecase(this.sprintRepo);
  final SprintRepo sprintRepo;

  @override
  Future<Either<Failure, Unit>> call(TokenWithIdParam param) {
    return sprintRepo.showProjectSprints(param);
  }
}
