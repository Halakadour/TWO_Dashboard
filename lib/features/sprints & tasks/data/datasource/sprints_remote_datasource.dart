// create : token,lable, description, goal, start, end, projectId, status
// update : token, sprintId,lable, description, goal, start, end, projectId, status
// show project sprints : token, projectId
// delete sprint : token, sprintId, status, taskId
// show sprint : token, taskId

import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/sprint_param.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/show_and_create_sprint_response_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/show_project_sprints_response_model.dart';

abstract class SprintsRemoteDatasource {
  Future<ShowAndCreateSprintResponseModel> createSprint(
    CreateOrUpdateSprintParam param,
  );
  Future<EmptyResponseModel> updateSprint(CreateOrUpdateSprintParam param);
  Future<EmptyResponseModel> deleteSprint(TokenWithIdParam sprint);
  Future<ShowProjectSprintsResponseModel> showProjectSprints(
    TokenWithIdParam project,
  );
  Future<ShowAndCreateSprintResponseModel> showSprintDetails(
    TokenWithIdParam sprint,
  );
}

class SprintsRemoteDatasourceImpl extends SprintsRemoteDatasource {
  @override
  Future<ShowAndCreateSprintResponseModel> createSprint(
    CreateOrUpdateSprintParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/create/sprint"),
      token: param.token,
      body: ({
        'label': param.lable,
        'description': param.description,
        'goal': param.goal,
        'start': param.start,
        'end': param.end,
        'project_id': param.projectId,
        'status': param.status,
      }),
      fromJson: showAndCreateSprintResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteSprint(TokenWithIdParam sprint) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/sprint/${sprint.id}"),
      token: sprint.token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowProjectSprintsResponseModel> showProjectSprints(
    TokenWithIdParam project,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/project/sprints/${project.id}"),
      token: project.token,
      fromJson: showProjectSprintsResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowAndCreateSprintResponseModel> showSprintDetails(
    TokenWithIdParam sprint,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/sprint/${sprint.id}"),
      token: sprint.token,
      fromJson: showAndCreateSprintResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateSprint(
    CreateOrUpdateSprintParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/update/sprint"),
      token: param.token,
      body: ({
        'label': param.lable,
        'description': param.description,
        'goal': param.goal,
        'start': param.start,
        'end': param.end,
        'project_id': param.projectId,
        'status': param.status,
        'sprint_id': param.sprintId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
