import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/auth/data/models/user_model.dart';

abstract class AuthRepo with HandlingExceptionManager {
  Future<Either<Failure, UserModel>> registNewUser(
    String name,
    String email,
    String password,
    String confirmPassword,
  );
  Future<Either<Failure, UserModel>> registLoginWithGoogle();
  Future<Either<Failure, UserModel>> registLoginWithGithup();
  Future<Either<Failure, UserModel>> loginUser(String email, String password);
  Future<Either<Failure, Unit>> logoutUser(String token);
}
