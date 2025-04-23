import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/profile/domain/repos/profile_repo.dart';

class ToggleUserApprovedUsecase
    extends UseCase<Future<Either<Failure, Unit>>, ToggleUserParam> {
  ToggleUserApprovedUsecase(this.profileRepo);
  final ProfileRepo profileRepo;

  @override
  Future<Either<Failure, Unit>> call(ToggleUserParam param) {
    return profileRepo.toggleUserApproved(param.token, param.userId);
  }
}

class ToggleUserParam {
  String token;
  int userId;
  ToggleUserParam({required this.token, required this.userId});
}
