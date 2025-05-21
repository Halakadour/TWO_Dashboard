import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/features/projects%20&%20team/data/models/team/create_team_add_members_response_model.dart';
import 'package:two_dashboard/features/projects%20&%20team/data/models/team/show_team_reponse_model.dart';

abstract class TeamRemoteDataSource {
  Future<CreateTeamResponseModel> createTeam(
    String token,
    String name,
    int mgrId,
    List<int> memebersIdList,
  );
  Future<CreateTeamResponseModel> addMembers(
    String token,
    int teamId,
    List<int> memebersIdList,
  );
  Future<ShowTeamResponseModel> showTeams();
}

class TeamRemoteDataSourceImpl extends TeamRemoteDataSource {
  @override
  Future<CreateTeamResponseModel> addMembers(
    String token,
    int teamId,
    List<int> memebersIdList,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/add/members"),
      token: token,
      body: ({"team_id": teamId, "team_members": memebersIdList}),
      fromJson: createTeamResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<CreateTeamResponseModel> createTeam(
    String token,
    String name,
    int mgrId,
    List<int> memebersIdList,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/create/team"),
      token: token,
      body: ({
        "name": name,
        "team_manager": mgrId,
        "team_members": memebersIdList,
      }),
      fromJson: createTeamResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<ShowTeamResponseModel> showTeams() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/teams"),
      fromJson: showTeamResponseModelFromJson,
    );
    return await result.callRequest();
  }
}
