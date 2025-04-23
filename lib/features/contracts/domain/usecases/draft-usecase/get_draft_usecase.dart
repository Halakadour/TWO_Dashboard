import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class GetDraftUsecase
    extends
        UseCase<
          Future<Either<Failure, List<DraftEntity>>>,
          GetDraftOrContractParam
        > {
  GetDraftUsecase(this.contractRepo);

  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, List<DraftEntity>>> call(
    GetDraftOrContractParam param,
  ) {
    return contractRepo.getDrafts(param.token, param.filter);
  }
}

class GetDraftOrContractParam {
  String token;
  int filter;
  GetDraftOrContractParam({required this.token, required this.filter});
}
