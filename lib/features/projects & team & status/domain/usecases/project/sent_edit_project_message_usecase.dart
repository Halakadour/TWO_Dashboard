import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/project_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/repos/project_repo.dart';

class SentEditProjectMessageUsecase
    extends UseCase<Future<Either<Failure, Unit>>, EditProjectRequestParam> {
  final ProjectRepo projectRepo;

  SentEditProjectMessageUsecase(this.projectRepo);

  @override
  Future<Either<Failure, Unit>> call(EditProjectRequestParam param) {
    return projectRepo.sentEditProjectRequest(param);
  }
}
