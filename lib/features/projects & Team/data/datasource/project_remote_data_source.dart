import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20Team/data/models/project/create_project_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20Team/data/models/project/show_my_project_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20Team/data/models/project/show_project_response_model.dart';

abstract class ProjectRemoteDataSource {
  Future<CreateProjectResponseModel> createProject(
    String token,
    String name,
    String description,
    int contractId,
    int teamId,
    String startDate,
    String endDate,
    int private,
  );
  Future<EmptyResponseModel> updateProject(
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
  Future<EmptyResponseModel> deleteProject(int projectId, String token);
  Future<ShowProjectResponseModel> showPublicProjects();
  Future<ShowProjectResponseModel> showAllProjects(String token);
  Future<ShowUserProjectsResponseModel> showUserProjects(String token);
}

class ProjectDataSourceImpl extends ProjectRemoteDataSource {
  @override
  Future<CreateProjectResponseModel> createProject(
    String token,
    String name,
    String description,
    int contractId,
    int teamId,
    String startDate,
    String endDate,
    int private,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/create/project"),
      token: token,
      body: ({
        "name": name,
        "description": description,
        "contract_id": contractId,
        "team_id": teamId,
        "start": startDate,
        "end": endDate,
        "private": private,
      }),
      fromJson: createProjectResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteProject(int projectId, String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/project/$projectId"),
      token: token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectResponseModel> showAllProjects(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/all/projects"),
      token: token,
      fromJson: showProjectResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectResponseModel> showPublicProjects() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/public/projects"),
      fromJson: showProjectResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowUserProjectsResponseModel> showUserProjects(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/my/projects"),
      token: token,
      fromJson: showUserProjectsResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateProject(
    int projectId,
    String token,
    String name,
    String description,
    int contractId,
    int teamId,
    String startDate,
    String endDate,
    int private,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/update/project"),
      token: token,
      body: ({
        "name": name,
        "description": description,
        "contract_id": contractId,
        "team_id": teamId,
        "start": startDate,
        "end": endDate,
        "private": private,
        "project_id": projectId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
