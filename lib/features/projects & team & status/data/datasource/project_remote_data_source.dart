import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/project_param.dart';
import 'package:two_dashboard/core/param/team_param.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/create_project_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/show_project_edit_request_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/show_project_response_model.dart';

abstract class ProjectRemoteDataSource {
  Future<CreateProjectResponseModel> createProject(UpdateProjectParam param);
  Future<EmptyResponseModel> updateProject(UpdateProjectParam param);
  Future<EmptyResponseModel> deleteProject(TokenWithIdParam project);
  Future<ShowProjectsResponseModel> showPublicProjects();
  Future<ShowProjectsResponseModel> showAllProjects(String token);
  Future<ShowProjectsResponseModel> showUserProjects(String token);
  Future<ShowProjectsResponseModel> showPendingProjects(String token);
  Future<EmptyResponseModel> sentEditProjectRequest(
    EditProjectRequestParam param,
  );
  Future<ShowProjectsEditRequestResponseModel> showProjectEditRequest(
    TokenWithIdParam project,
  );
  Future<EmptyResponseModel> rejectProject(TokenWithIdParam project);
  Future<EmptyResponseModel> approveProject(TokenWithIdParam project);
  Future<EmptyResponseModel> specifyProjectTeam(AddTeamParam param);
}

class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  @override
  Future<CreateProjectResponseModel> createProject(
    UpdateProjectParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/create/project"),
      token: param.token,
      body: ({
        "full_name": param.fullName,
        "company_name": param.companyName,
        "email": param.email,
        "phone": param.phone,
        "project_type": param.projectType,
        "project_description": param.projectDescription,
        "cost": param.cost,
        "duration": param.duration,
        "requirements": param.requirements,
        "document": param.document,
        "cooperation_type": param.cooperationType,
        "contact_time": param.contactTime,
        "private": param.visibility,
      }),
      fromJson: createProjectResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteProject(TokenWithIdParam project) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/project/${project.id}"),
      token: project.token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectsResponseModel> showAllProjects(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/all/projects"),
      token: token,
      fromJson: showProjectsResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectsResponseModel> showPublicProjects() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/public/projects"),
      fromJson: showProjectsResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectsResponseModel> showUserProjects(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/my/projects"),
      token: token,
      fromJson: showProjectsResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateProject(UpdateProjectParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/update/project"),
      token: param.token,
      body: ({
        "full_name": param.fullName,
        "company_name": param.companyName,
        "email": param.email,
        "phone": param.phone,
        "project_type": param.projectType,
        "project_description": param.projectDescription,
        "cost": param.cost,
        "duration": param.duration,
        "requirements": param.requirements,
        "document": param.document,
        "cooperation_type": param.cooperationType,
        "contact_time": param.contactTime,
        "private": param.visibility,
        "project_id": param.projectId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> approveProject(TokenWithIdParam project) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/approve/project/${project.id}"),
      token: project.token,
      fromJson: emptyResponseModelFromJson,
    );

    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> rejectProject(TokenWithIdParam project) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/reject/project/${project.id}"),
      token: project.token,
      fromJson: emptyResponseModelFromJson,
    );

    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> sentEditProjectRequest(
    EditProjectRequestParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/edit/project/request"),
      token: param.token,
      body: ({'message': param.message, 'project_id': param.projectId}),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<ShowProjectsResponseModel> showPendingProjects(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/pending/projects"),
      token: token,
      fromJson: showProjectsResponseModelFromJson,
    );

    return await result.callRequest();
  }

  @override
  Future<ShowProjectsEditRequestResponseModel> showProjectEditRequest(
    TokenWithIdParam project,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/latest/edit/request/${project.id}"),
      token: project.token,
      fromJson: showProjectsEditRequestResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> specifyProjectTeam(AddTeamParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/specify/project/team"),
      token: param.token,
      body: {"project_id": param.projectId, "team_id": param.teamId},
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
