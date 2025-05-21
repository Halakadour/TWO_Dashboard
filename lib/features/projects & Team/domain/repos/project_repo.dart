import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';

abstract class ProjectRepo with HandlingExceptionManager {
  Future<Either<Failure, ProjectEntity>> createProject(
    String token,
    String name,
    String description,
    int contractId,
    int teamId,
    String startDate,
    String endDate,
    int private,
  );
  Future<Either<Failure, Unit>> updateProject(
    int projectId,
    String token,
    String name,
    String description,
    int contractId,
    int teamId,
    String startDate,
    String endDate,
    int private,
  );
  Future<Either<Failure, Unit>> deleteProject(int projectId, String token);
  Future<Either<Failure, List<ProjectEntity>>> showPublicProjects();
  Future<Either<Failure, List<ProjectEntity>>> showAllProjects(String token);
  Future<Either<Failure, List<ProjectEntity>>> showUserProjects(String token);
}
