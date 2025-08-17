import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/features/roles/data/models/role_response_model.dart';

abstract class RoleRemoteDatasource {
  Future<RoleResponesModel> showRolesWithoutClient();
  Future<RoleResponesModel> showRoleClient();
  Future<RoleResponesModel> showAllRoles();
}

class RoleRemoteDatasourceImpl extends RoleRemoteDatasource {
  @override
  Future<RoleResponesModel> showRoleClient() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/role/client"),
      fromJson: roleResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<RoleResponesModel> showRolesWithoutClient() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/roles"),
      fromJson: roleResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<RoleResponesModel> showAllRoles() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/all/roles"),
      fromJson: roleResponesModelFromJson,
    );
    return await result.callRequest();
  }
}
