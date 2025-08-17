import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/project_param.dart';
import 'package:two_dashboard/core/param/team_param.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/datasource/project_remote_data_source.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/show_project_edit_request_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/repos/project_repo.dart';

class ProjectRepoImpl extends ProjectRepo {
  final ProjectRemoteDataSource projectRemoteDataSource;

  ProjectRepoImpl(this.projectRemoteDataSource);
  @override
  Future<Either<Failure, ProjectEntity>> createProject(
    UpdateProjectParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.createProject(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteProject(TokenWithIdParam project) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.deleteProject(project);
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
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> updateProject(UpdateProjectParam param) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.updateProject(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> approveProject(TokenWithIdParam project) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.approveProject(project);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> rejectProject(RejectProjectParam param) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.rejectProject(param);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> showPendingProjects(
    String token,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.showPendingProjects(token);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<MessageModel>>> showProjectEditRequest(
    TokenWithIdParam project,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await projectRemoteDataSource.showProjectEditRequest(
          project,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> specifyProjectTeam(AddTeamParam param) {
    return wrapHandling(
      tryCall: () async {
        await projectRemoteDataSource.specifyProjectTeam(param);
        return Right(unit);
      },
    );
  }
}
