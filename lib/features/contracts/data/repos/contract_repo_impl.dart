import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/features/contracts/data/datasource/contract_remote_datasource.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/domain/repos/contract_repo.dart';

class ContractRepoImpl extends ContractRepo {
  final ContractRemoteDatasource contractDatasource;

  ContractRepoImpl(this.contractDatasource);
  @override
  Future<Either<Failure, ContractEntity>> addContract(AddContractParam param) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.addContract(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> addSign(AddSignParam param) {
    return wrapHandling(
      tryCall: () async {
        await contractDatasource.addSign(param);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, DraftEntity>> createDraft(CreateDraftParam param) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.createDraft(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deletDraft(TokenWithIdParam draft) {
    return wrapHandling(
      tryCall: () async {
        await contractDatasource.deletDraft(draft);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<ContractEntity>>> getClientContract(
    GetDraftOrContractParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.getClientContract(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ContractEntity>>> getContracts(
    GetDraftOrContractParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.getContracts(param);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<DraftEntity>>> getDrafts(
    GetDraftOrContractParam param,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await contractDatasource.getDrafts(param);
        return Right(result.data);
      },
    );
  }
}
