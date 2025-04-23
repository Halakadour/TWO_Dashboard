import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';

abstract class ContractRepo with HandlingExceptionManager {
  //Contract ones
  Future<Either<Failure, ContractEntity>> addContract(
    String token,
    String contract,
    int clientId,
    int drafId,
  );
  Future<Either<Failure, Unit>> addSign(
    String token,
    String signature,
    int contractId,
  );
  Future<Either<Failure, List<ContractEntity>>> getContracts(
    String token,
    int filter,
  );
  Future<Either<Failure, List<ContractEntity>>> getClientContract(
    String token,
    int filter,
    String clientId,
  );
  // Draf ones
  Future<Either<Failure, DraftEntity>> createDraft(
    String token,
    String draf,
    int clientId,
  );
  Future<Either<Failure, Unit>> deletDraft(String token, int drafId);
  Future<Either<Failure, List<DraftEntity>>> getDrafts(
    String token,
    int filter,
  );
}
