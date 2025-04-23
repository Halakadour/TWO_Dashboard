import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';
import 'package:two_dashboard/features/contracts/domain/usecases/draft-usecase/get_draft_usecase.dart';

class GetContractsUsecase
    extends
        UseCase<
          Future<Either<Failure, List<ContractEntity>>>,
          GetDraftOrContractParam
        > {
  final ContractRepo contractRepo;

  GetContractsUsecase(this.contractRepo);

  @override
  Future<Either<Failure, List<ContractEntity>>> call(
    GetDraftOrContractParam param,
  ) {
    return contractRepo.getContracts(param.token, param.filter);
  }
}
