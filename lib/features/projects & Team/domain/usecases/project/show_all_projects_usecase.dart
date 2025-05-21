import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/repos/project_repo.dart';

class ShowAllProjectsUsecase
    extends UseCase<Future<Either<Failure, List<ProjectEntity>>>, String> {
  final ProjectRepo projectRepo;

  ShowAllProjectsUsecase(this.projectRepo);
  @override
  Future<Either<Failure, List<ProjectEntity>>> call(String param) {
    return projectRepo.showAllProjects(param);
  }
}
