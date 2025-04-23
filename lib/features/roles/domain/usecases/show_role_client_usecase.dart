import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/no_param_use_case.dart';
import 'package:two_dashboard/features/roles/data/models/role_response_model.dart';
import 'package:two_dashboard/features/roles/domain/repos/role_repo.dart';

class ShowRoleClientUsecase
    extends NoParamUseCase<Future<Either<Failure, RoleResponesModel>>> {
  final RoleRepo roleRepo;

  ShowRoleClientUsecase(this.roleRepo);

  @override
  Future<Either<Failure, RoleResponesModel>> call() {
    return roleRepo.showRoleClient();
  }
}
