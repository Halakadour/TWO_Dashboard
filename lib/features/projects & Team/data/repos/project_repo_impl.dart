import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/features/projects%20&%20team/data/datasource/project_remote_data_source.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/repos/project_repo.dart';

class ProjectRepoImpl extends ProjectRepo {
  final ProjectRemoteDataSource projectRemoteDataSource;

  ProjectRepoImpl(this.projectRemoteDataSource);
  @override
  Future<Either<Failure, ProjectEntity>> createProject(
    String token,
    String name,
    String description,
    int contractId,
    int teamId,
    String startDate,
    String endDate,
    int private,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.createProject(
          token,
          name,
          description,
          contractId,
          teamId,
          startDate,
          endDate,
          private,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteProject(int projectId, String token) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.deleteProject(projectId, token);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> showAllProjects(String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.showAllProjects(token);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> showPublicProjects() {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.showPublicProjects();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> showUserProjects(String token) {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.showUserProjects(token);
        // It should Returns a List
        return Right([result]);
      },
    );
  }

  @override
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
  ) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.updateProject(
          projectId,
          token,
          name,
          description,
          contractId,
          teamId,
          startDate,
          endDate,
          private,
        );
        return Right(unit);
      },
    );
  }
}
