import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/features/contracts/data/models/contract/add_contract_response_model.dart';
import 'package:two_dashboard/features/contracts/data/models/contract/show_contract_response_model.dart';
import 'package:two_dashboard/features/contracts/data/models/draft/add_draft_response_model.dart';
import 'package:two_dashboard/features/contracts/data/models/draft/show_draft_response_model.dart';

abstract class ContractRemoteDatasource {
  //Contract ones
  Future<AddContractResponseModel> addContract(AddContractParam param);
  Future<EmptyResponseModel> addSign(AddSignParam param);
  Future<ShowContractResponseModel> getContracts(GetDraftOrContractParam param);
  Future<ShowContractResponseModel> getClientContract(
    GetDraftOrContractParam param,
  );
  // Draf ones
  Future<AddDraftResponseModel> createDraft(CreateDraftParam param);
  Future<EmptyResponseModel> deletDraft(TokenWithIdParam draft);
  Future<ShowDraftResponseModel> getDrafts(GetDraftOrContractParam param);
}

class ContractRemoteDatasourceImpl implements ContractRemoteDatasource {
  @override
  Future<AddContractResponseModel> addContract(AddContractParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/create/contract"),
      token: param.token,
      body: ({
        'contract': '$pdfBase64${param.contract}',
        'client_id': param.clientId.toString(),
        'draft_id': param.drafId.toString(),
      }),
      fromJson: addContractResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> addSign(AddSignParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/add/sign"),
      token: param.token,
      body: ({
        'signature': '$imageBase64${param.signature}',
        'contract_id': param.contractId,
      }),
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<AddDraftResponseModel> createDraft(CreateDraftParam param) async {
    final result = PostWithTokenApi(
      uri: Uri.parse("$baseUri/api/create/draft"),
      token: param.token,
      body: ({
        'contract': '$documentBase64${param.draf}',
        'user_id': param.clientId,
      }),
      fromJson: addDraftResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deletDraft(TokenWithIdParam draft) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/draft/contract/${draft.id}"),
      token: draft.token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowContractResponseModel> getClientContract(
    GetDraftOrContractParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse(
        "$baseUri/api/show/client/contracts?filter[state]=${param.filter}",
      ),
      token: param.token,
      fromJson: showContractResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowContractResponseModel> getContracts(
    GetDraftOrContractParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse(
        "$baseUri/api/show/contracts?filter[state]=${param.filter}",
      ),
      token: param.token,
      fromJson: showContractResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowDraftResponseModel> getDrafts(
    GetDraftOrContractParam param,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/drafts?filter[state]=${param.filter}"),
      token: param.token,
      fromJson: showDraftResponseModelFromJson,
    );
    return await result.callRequest();
  }
}
