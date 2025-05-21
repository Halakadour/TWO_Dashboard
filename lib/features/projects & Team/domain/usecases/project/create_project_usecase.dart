// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/repos/project_repo.dart';

import '../../../../../core/error/failures.dart';

class CreateProjectUsecase
    extends
        UseCase<Future<Either<Failure, ProjectEntity>>, CreateProjectParam> {
  final ProjectRepo projectRepo;

  CreateProjectUsecase(this.projectRepo);
  @override
  Future<Either<Failure, ProjectEntity>> call(CreateProjectParam param) {
    return projectRepo.createProject(
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

class CreateProjectParam {
  final String name;
  final String token;
  final String description;
  final int contractId;
  final int teamId;
  final String startDate;
  final String endDate;
  final int private;
  CreateProjectParam({
    required this.name,
    required this.token,
    required this.description,
    required this.contractId,
    required this.teamId,
    required this.startDate,
    required this.endDate,
    required this.private,
  });
}
