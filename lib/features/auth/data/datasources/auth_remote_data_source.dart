import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/features/auth/data/models/auth_response_model.dart';

import '../../../../core/api/post_api.dart';
import '../../../../core/api/post_api_with_token.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> regist(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
  Future<AuthResponseModel> login(String email, String password);
  Future<EmptyResponseModel> logout(String token);
  Future<AuthResponseModel> registLoginWithGoogle();
  Future<AuthResponseModel> registLoginWithGithup();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<AuthResponseModel> regist(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/register"),
      body: ({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      }),
      fromJson: authResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/login"),
      body: ({'email': email, 'password': password}),
      fromJson: authResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> logout(String token) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/logout"),
      token: token,
      body: ({}),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<AuthResponseModel> registLoginWithGithup() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/auth/github/callback"),
      fromJson: authResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<AuthResponseModel> registLoginWithGoogle() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/auth/google/callback"),
      fromJson: authResponseModelFromJson,
    );
    return await result.callRequest();
  }
}
