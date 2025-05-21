import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/repos/project_repo.dart';

import '../../../../../core/error/failures.dart';

class DeleteProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, DeleteProjectParam> {
  final ProjectRepo projectRepo;

  DeleteProjectUsecase(this.projectRepo);
  @override
  Future<Either<Failure, Unit>> call(DeleteProjectParam param) {
    return projectRepo.deleteProject(param.projectId, param.token);
  }
}

class DeleteProjectParam {
  final String token;
  final int projectId;

  DeleteProjectParam({required this.token, required this.projectId});
}
