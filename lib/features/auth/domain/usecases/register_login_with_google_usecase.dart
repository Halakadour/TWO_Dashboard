import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/no_param_use_case.dart';
import 'package:two_dashboard/features/auth/data/models/register_new_user_model.dart';
import 'package:two_dashboard/features/auth/domain/repos/auth_repo.dart';

class RegisterLoginWithGoogleUsecase
    extends NoParamUseCase<Future<Either<Failure, RegisterNewUserModel>>> {
  final AuthRepo authRepo;

  RegisterLoginWithGoogleUsecase(this.authRepo);

  @override
  Future<Either<Failure, RegisterNewUserModel>> call() {
    return authRepo.registLoginWithGoogle();
  }
}
