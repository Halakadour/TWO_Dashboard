import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/task/create_task_response_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/task/show_task_list_response_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/task/show_task_response_model.dart';

abstract class TaskRemoteDatasource {
  Future<CreateTaskResponseModel> createTask(CreateOrUpdateTaskParam param);
  Future<EmptyResponseModel> updateTask(CreateOrUpdateTaskParam param);
  Future<EmptyResponseModel> deleteTask(TokenWithIdParam task);
  Future<ShowTaskListResponseModel> showProjectTasks(TokenWithIdParam project);
  Future<ShowTaskListResponseModel> showSprintTasks(TokenWithIdParam sprint);
  Future<ShowTaskResponseModel> showTask(TokenWithIdParam task);
  Future<ShowTaskListResponseModel> showEmployeeTasks(
    ShowEmployeeTasksParam param,
  );
  Future<ShowTaskListResponseModel> showEmployeeProjectTasks(
    ShowEmployeeProjectTasksParam param,
  );
}

class TaskRemoteDatasourceImpl extends TaskRemoteDatasource {
  @override
  Future<CreateTaskResponseModel> createTask(
    CreateOrUpdateTaskParam param,
  ) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/create/task"),
      token: param.token!,
      body: ({
        'title': param.title,
        'description': param.description,
        'project_id': param.projectId.toString(),
        'sprint_id': param.sprintId.toString(),
        'status_id': param.status.toString(),
        'user_id': param.userId.toString(),
        'priority': param.priority,
        'completion': param.completion,
        'start': param.startDate,
        'end': param.endDate,
      }),
      fromJson: createTaskResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteTask(TokenWithIdParam task) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/task/${task.id}"),
      token: task.token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowTaskListResponseModel> showEmployeeProjectTasks(
    ShowEmployeeProjectTasksParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse(
        "$baseUri/api/show/project/employee/tasks?filter[sprint_id]=${param.sprinttId}&filter[priority]=${param.proirity}&filter[status_id]=${param.status}",
      ),
      token: param.token,
      fromJson: showTaskListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowTaskListResponseModel> showEmployeeTasks(
    ShowEmployeeTasksParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse(
        "$baseUri/api/show/employee/tasks?filter[project_id]=${param.projectId}&filter[priority]=${param.proirity}",
      ),
      token: param.token,
      fromJson: showTaskListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowTaskListResponseModel> showProjectTasks(
    TokenWithIdParam project,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/project/tasks/${project.id}"),
      token: project.token,
      fromJson: showTaskListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowTaskListResponseModel> showSprintTasks(
    TokenWithIdParam sprint,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/sprint/tasks/${sprint.id}"),
      token: sprint.token,
      fromJson: showTaskListResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowTaskResponseModel> showTask(TokenWithIdParam task) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/task/${task.id}"),
      token: task.token,
      fromJson: showTaskResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateTask(CreateOrUpdateTaskParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/update/task"),
      token: param.token!,
      body: ({
        'title': param.title,
        'description': param.description,
        'project_id': param.projectId.toString(),
        'sprint_id': param.sprintId.toString(),
        'status_id': param.status.toString(),
        'user_id': param.userId.toString(),
        'priority': param.priority,
        'completion': param.completion,
        'start': param.startDate,
        'end': param.endDate,
        'task_id': param.taskId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
