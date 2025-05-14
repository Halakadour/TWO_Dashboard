import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20Team/domain/repos/project_repo.dart';

import '../../../../../core/error/failures.dart';

class UpdateProjectUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateProjectParam> {
  final ProjectRepo projectRepo;

  UpdateProjectUsecase(this.projectRepo);

  @override
  Future<Either<Failure, Unit>> call(UpdateProjectParam param) {
    return projectRepo.updateProject(
      param.projectId,
      param.token,
      param.name,
      param.description,
      param.contractId,
      param.teamId,
      param.startDate,
      param.endDate,
      param.private,
    );
  }
}

class UpdateProjectParam {
  final int projectId;
  final String token;
  final String name;
  final String description;
  final int contractId;
  final int teamId;
  final String startDate;
  final String endDate;
  final int private;

  UpdateProjectParam({
    required this.projectId,
    required this.token,
    required this.name,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.startDate,
    required this.endDate,
    required this.private,
  });
}
