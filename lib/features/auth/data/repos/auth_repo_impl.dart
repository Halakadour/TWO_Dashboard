import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:two_dashboard/features/auth/data/models/user_model.dart';
import 'package:two_dashboard/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, UserModel>> loginUser(String email, String password) {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.login(email, password);
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> logoutUser(String token) {
    return wrapHandling(
      tryCall: () async {
        await authRemoteDataSource.logout(token);
        return const Right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> registNewUser(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.regist(
          name,
          email,
          password,
          confirmPassword,
        );
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> registLoginWithGithup() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGithup();
        return Right(result.data);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> registLoginWithGoogle() {
    return wrapHandling(
      tryCall: () async {
        final result = await authRemoteDataSource.registLoginWithGoogle();
        return Right(result.data);
      },
    );
  }
}
