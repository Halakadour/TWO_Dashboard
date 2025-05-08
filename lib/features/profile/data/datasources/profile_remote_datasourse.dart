import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/features/profile/data/models/get_user_profile_response_model.dart';
import 'package:two_dashboard/features/profile/data/models/show_clients_response_model.dart';
import 'package:two_dashboard/features/profile/data/models/show_users_with_filter_response_model.dart';
import 'package:two_dashboard/features/profile/data/models/toggle_user_approved_response_model.dart';
import 'package:two_dashboard/features/profile/data/models/update_profile_response_model.dart';

abstract class ProfileRemoteDatasourse {
  Future<UpdateProfileResponesModel> updateEmployeeProfile(
    String token,
    String image,
    String cv,
    int roleId,
  );
  Future<GetUserProfileResponseModel> getUserProfile(String token);
  Future<ShowUsersWithFilterResponseModel> showUserWithFilter(
    int approvedFilter,
    int? roleFilter,
    String token,
  );
  Future<ShowClientsResponseModel> showClients();
  Future<ToggleUserApprovedResponseModel> toggleUserApproved(
    String token,
    int userId,
  );
}

class ProfileRemoteDatasourseImpl extends ProfileRemoteDatasourse {
  @override
  Future<UpdateProfileResponesModel> updateEmployeeProfile(
    String token,
    String image,
    String cv,
    int roleId,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/update/employee/profile"),
      body: ({
        'image': '$imageBase64$image',
        'cv': '$pdfBase64$cv',
        'role_id': roleId.toString(),
      }),
      fromJson: updateProfileResponesModelFromJson,
      token: token,
    );
    return await result.call();
  }

  @override
  Future<ShowUsersWithFilterResponseModel> showUserWithFilter(
    int approvedFilter,
    int? roleFilter,
    String token,
  ) async {
    String uri = "$baseUri/api/show/users?filter[role_id]=${roleFilter ?? 2}";
    // if (roleFilter != null) {
    //   uri += "&filter[role_id]=$roleFilter";
    // }

    final result = GetWithTokenApi(
      uri: Uri.parse(uri),
      token: token,
      fromJson: showUsersWithFilterResponseModelFromJson,
    );

    return await result.callRequest();
  }

  @override
  Future<ToggleUserApprovedResponseModel> toggleUserApproved(
    String token,
    int userId,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/toggle/user/approved/$userId"),
      token: token,
      fromJson: toggleUserApprovedResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowClientsResponseModel> showClients() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/clients"),
      fromJson: showClientsResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<GetUserProfileResponseModel> getUserProfile(String token) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/user/profile"),
      token: token,
      fromJson: getUserProfileResponseModelFromJson,
    );
    return await result.callRequest();
  }
}
