import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/auth/data/models/user_model.dart';
import 'package:two_dashboard/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/error/failures.dart';

class LoginUsecase
    extends UseCase<Future<Either<Failure, UserModel>>, LoginParams> {
  final AuthRepo authRepo;
  LoginUsecase(this.authRepo);

  @override
  Future<Either<Failure, UserModel>> call(LoginParams param) async {
    return await authRepo.loginUser(param.email, param.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({required this.email, required this.password});
}
