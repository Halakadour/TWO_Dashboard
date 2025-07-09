import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/repos/project_repo.dart';

class RejectProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, TokenWithIdParam> {
  final ProjectRepo projectRepo;

  RejectProjectUsecase(this.projectRepo);

  @override
  Future<Either<Failure, Unit>> call(TokenWithIdParam param) {
    return projectRepo.rejectProject(param);
  }
}
