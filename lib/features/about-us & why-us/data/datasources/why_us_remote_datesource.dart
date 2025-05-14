import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/data/models/why-us-models/create_why_us_response_model.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/data/models/why-us-models/show_why_us_response_model.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/domain/usecases/why-us-usecase/create_why_us_usecase.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/domain/usecases/why-us-usecase/delete_why_us_usecase.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/domain/usecases/why-us-usecase/update_why_us_usecase.dart';

abstract class WhyUsRemoteDatesource {
  Future<ShowWhyUsResponesModel> showWhyUs();
  Future<CreateWhyUsResponseModel> createWhyUs(CreateWhyUsParam whyUs);
  Future<EmptyResponseModel> updateWhyUs(UpdateWhyUsParam whyUs);
  Future<EmptyResponseModel> deleteWhyUs(DeleteWhyUsParam whyUs);
}

class WhyUsRemoteDatesourceImpl extends WhyUsRemoteDatesource {
  @override
  Future<CreateWhyUsResponseModel> createWhyUs(CreateWhyUsParam whyUs) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/create/whyUS"),
      token: whyUs.token,
      body: ({'why_us': whyUs.whyUs}),
      fromJson: createWhyUsResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deleteWhyUs(DeleteWhyUsParam whyUs) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/whyUs/${whyUs.whyUsId}"),
      token: whyUs.token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowWhyUsResponesModel> showWhyUs() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/whyUs"),
      fromJson: showWhyUsResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<EmptyResponseModel> updateWhyUs(UpdateWhyUsParam whyUs) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/update/whyUS"),
      token: whyUs.token,
      body: ({'why_us': whyUs.whyUs, 'why_id': whyUs.whyUsId}),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }
}
