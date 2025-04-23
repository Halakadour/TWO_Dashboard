import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/profile/domain/repos/profile_repo.dart';

class UpdateEmployeeProfileUsecase
    extends UseCase<Future<Either<Failure, Unit>>, EmployeeProfileParam> {
  final ProfileRepo profileRepo;

  UpdateEmployeeProfileUsecase(this.profileRepo);

  @override
  Future<Either<Failure, Unit>> call(EmployeeProfileParam param) {
    return profileRepo.updateEmployeeProfile(
      param.token,
      param.image,
      param.cv,
      param.roleId,
    );
  }
}

class EmployeeProfileParam {
  final String token;
  final String image;
  final String cv;
  final int roleId;

  EmployeeProfileParam({
    required this.token,
    required this.image,
    required this.cv,
    required this.roleId,
  });
}
