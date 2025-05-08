import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/network/network_connection_checker.dart';
import 'package:two_dashboard/features/profile/data/datasources/profile_locale_datasource.dart';
import 'package:two_dashboard/features/profile/data/datasources/profile_remote_datasourse.dart';
import 'package:two_dashboard/features/profile/domain/entities/client_entity.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';
import 'package:two_dashboard/features/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDatasourse profileRemoteDatasourse;
  final ProfileLocaleDatasource profileLocaleDatasourse;
  final NetworkInfoImpl networkInfo;

  ProfileRepoImpl(
    this.profileRemoteDatasourse,
    this.profileLocaleDatasourse,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, Unit>> updateEmployeeProfile(
    String token,
    String image,
    String cv,
    int roleId,
  ) {
    return wrapHandling(
      tryCall: () async {
        await profileRemoteDatasourse.updateEmployeeProfile(
          token,
          image,
          cv,
          roleId,
        );
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, List<EmployeeEntity>>> showUsersWithFilter(
    int approvedFilter,
    int? roleFilter,
    String token,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.showUserWithFilter(
          approvedFilter,
          roleFilter,
          token,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, List<ClientEntity>>> showClients() {
    return wrapHandling(
      tryCall: () async {
        final result = await profileRemoteDatasourse.showClients();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> toggleUserApproved(String token, int userId) {
    return wrapHandling(
      tryCall: () async {
        await profileRemoteDatasourse.toggleUserApproved(token, userId);
        return Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, EmployeeEntity>> getUserProfile(String token) {
    return wrapHandling(
      tryCall: () async {
        if (await networkInfo.isConnected) {
          final remoteProfile = await profileRemoteDatasourse.getUserProfile(
            token,
          );
          profileLocaleDatasourse.cacheUserProfile(remoteProfile.data);
          return Right(remoteProfile.data);
        } else {
          final localProfile = await profileLocaleDatasourse.getUserProfile();
          return Right(localProfile);
        }
      },
    );
  }
}
