// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class AddContractUsecase
    extends UseCase<Future<Either<Failure, ContractEntity>>, AddContractParam> {
  AddContractUsecase(this.contractRepo);
  final ContractRepo contractRepo;

  @override
  Future<Either<Failure, ContractEntity>> call(AddContractParam param) {
    return contractRepo.addContract(
      param.token,
      param.contract,
      param.clientId,
      param.drafId,
    );
  }
}

class AddContractParam {
  String token;
  String contract;
  int clientId;
  int drafId;
  AddContractParam({
    required this.token,
    required this.contract,
    required this.clientId,
    required this.drafId,
  });
}
