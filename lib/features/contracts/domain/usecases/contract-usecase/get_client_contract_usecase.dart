// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class GetClientContractUsecase
    extends
        UseCase<
          Future<Either<Failure, List<ContractEntity>>>,
          GetDraftOrContractParam
        > {
  final ContractRepo contractRepo;

  GetClientContractUsecase(this.contractRepo);

  @override
  Future<Either<Failure, List<ContractEntity>>> call(
    GetDraftOrContractParam param,
  ) {
    return contractRepo.getClientContract(param);
  }
}
