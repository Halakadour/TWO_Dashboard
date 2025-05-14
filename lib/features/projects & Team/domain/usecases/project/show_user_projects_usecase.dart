import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20Team/domain/repos/project_repo.dart';

import '../../../../../core/error/failures.dart';
import '../../entity/project_entity.dart';

class ShowUserProjectsUsecase
    extends UseCase<Future<Either<Failure, List<ProjectEntity>>>, String> {
  final ProjectRepo projectRepo;

  ShowUserProjectsUsecase(this.projectRepo);
  @override
  Future<Either<Failure, List<ProjectEntity>>> call(String param) {
    return projectRepo.showUserProjects(param);
  }
}
