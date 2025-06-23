// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class AddSignUsecase
    extends UseCase<Future<Either<Failure, Unit>>, AddSignParam> {
  final ContractRepo contractRepo;

  AddSignUsecase(this.contractRepo);

  @override
  Future<Either<Failure, Unit>> call(AddSignParam param) {
    return contractRepo.addSign(param);
  }
}
