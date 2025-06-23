import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class CreateDraftUsecase
    extends UseCase<Future<Either<Failure, DraftEntity>>, CreateDraftParam> {
  CreateDraftUsecase(this.contractRepo);
  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, DraftEntity>> call(CreateDraftParam param) {
    return contractRepo.createDraft(param);
  }
}
