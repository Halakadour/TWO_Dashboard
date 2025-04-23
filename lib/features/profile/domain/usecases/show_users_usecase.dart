// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';
import 'package:two_dashboard/features/profile/domain/repos/profile_repo.dart';

class ShowUsersUsecase
    extends
        UseCase<Future<Either<Failure, List<EmployeeEntity>>>, ShowUsersParam> {
  final ProfileRepo profileRepo;

  ShowUsersUsecase(this.profileRepo);
  @override
  Future<Either<Failure, List<EmployeeEntity>>> call(ShowUsersParam param) {
    return profileRepo.showUsersWithFilter(
      param.approvedFilter,
      param.roleFilter,
      param.token,
    );
  }
}

class ShowUsersParam {
  int? roleFilter;
  int approvedFilter;
  String token;
  ShowUsersParam({
    required this.roleFilter,
    required this.approvedFilter,
    required this.token,
  });
}
