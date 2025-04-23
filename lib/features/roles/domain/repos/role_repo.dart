import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/roles/data/models/role_response_model.dart';

abstract class RoleRepo with HandlingExceptionManager {
  Future<Either<Failure, RoleResponesModel>> showRolesWithoutClient();
  Future<Either<Failure, RoleResponesModel>> showRoleClient();
}
