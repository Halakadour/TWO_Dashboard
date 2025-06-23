import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/core/param/casule_param.dart';
import 'package:two_dashboard/core/param/contract_draft_param.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';

abstract class ContractRepo with HandlingExceptionManager {
  //Contract ones
  Future<Either<Failure, ContractEntity>> addContract(AddContractParam param);
  Future<Either<Failure, Unit>> addSign(AddSignParam param);
  Future<Either<Failure, List<ContractEntity>>> getContracts(
    GetDraftOrContractParam param,
  );
  Future<Either<Failure, List<ContractEntity>>> getClientContract(
    GetDraftOrContractParam param,
  );
  // Draf ones
  Future<Either<Failure, DraftEntity>> createDraft(CreateDraftParam param);
  Future<Either<Failure, Unit>> deletDraft(TokenWithIdParam draft);
  Future<Either<Failure, List<DraftEntity>>> getDrafts(
    GetDraftOrContractParam param,
  );
}
