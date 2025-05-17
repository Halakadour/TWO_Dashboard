import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/profile/domain/entities/client_entity.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

abstract class ProfileRepo with HandlingExceptionManager {
  Future<Either<Failure, Unit>> updateEmployeeProfile(
    String token,
    String image,
    String cv,
    int roleId,
  );
  Future<Either<Failure, EmployeeEntity>> getUserProfile(String token);
  Future<Either<Failure, List<EmployeeEntity>>> showUsersWithFilter(
    int approvedFilter,
    int? roleFilter,
    String token,
  );
  Future<Either<Failure, List<ClientEntity>>> showClients();
  Future<Either<Failure, Unit>> toggleUserApproved(String token, int userId);
  Future<Either<Failure, Uint8List>> getImage(String imagePath);
}
