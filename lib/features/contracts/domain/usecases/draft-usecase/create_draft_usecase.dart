import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class CreateDraftUsecase
    extends UseCase<Future<Either<Failure, DraftEntity>>, CreateDrafParam> {
  CreateDraftUsecase(this.contractRepo);
  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, DraftEntity>> call(CreateDrafParam param) {
    return contractRepo.createDraft(param.token, param.draf, param.clientId);
  }
}

class CreateDrafParam {
  String token;
  String draf;
  int clientId;
  CreateDrafParam({
    required this.token,
    required this.draf,
    required this.clientId,
  });
}
