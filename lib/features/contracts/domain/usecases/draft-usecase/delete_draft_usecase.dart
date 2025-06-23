// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class DeleteDraftUsecase
    extends UseCase<Future<Either<Failure, Unit>>, TokenWithIdParam> {
  DeleteDraftUsecase(this.contractRepo);
  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, Unit>> call(TokenWithIdParam param) {
    return contractRepo.deletDraft(param);
  }
}
