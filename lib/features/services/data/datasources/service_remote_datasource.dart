import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/features/services/data/models/create_service_response_model.dart';
import 'package:two_dashboard/features/services/data/models/show_service_response_model.dart';

abstract class ServiceRemoteDatasource {
  Future<CreateServiceResponesModel> createService(
    String token,
    String title,
    String description,
    String image,
  );
  Future<EmptyResponseModel> deleteService(String token, int serviceId);
  Future<ShowServiceResponesModel> showServices();
  Future<EmptyResponseModel> updateService(
    String token,
    int serviceId,
    String title,
    String description,
    String image,
  );
}

class ServiceRemoteDatasourceImpl extends ServiceRemoteDatasource {
  @override
  Future<CreateServiceResponesModel> createService(
    String token,
    String title,
    String description,
    String image,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/create/service"),
      token: token,
      body: ({
        'title': title,
        'description': description,
        'image': '$imageBase64$image',
      }),
      fromJson: createServiceResponesModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteService(String token, int serviceId) async {
    final result = GetWithTokenApi(
      uri: Uri.parse('$baseUri/api/delete/service/$serviceId'),
      token: token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowServiceResponesModel> showServices() async {
    final result = GetApi(
      uri: Uri.parse('$baseUri/api/show/services'),
      fromJson: showServiceResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateService(
    String token,
    int serviceId,
    String title,
    String description,
    String image,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/update/service"),
      token: token,
      body: ({
        'title': title,
        'description': description,
        'image': '$imageBase64$image',
        'service_id': serviceId.toString(),
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
