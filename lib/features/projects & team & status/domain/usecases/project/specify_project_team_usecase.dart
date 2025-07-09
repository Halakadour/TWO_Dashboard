import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/team_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/repos/project_repo.dart';

class SpecifyProjectTeamUsecase
    extends UseCase<Future<Either<Failure, Unit>>, AddTeamParam> {
  SpecifyProjectTeamUsecase(this.projectRepo);
  final ProjectRepo projectRepo;

  @override
  Future<Either<Failure, Unit>> call(AddTeamParam param) {
    return projectRepo.specifyProjectTeam(param);
  }
}
