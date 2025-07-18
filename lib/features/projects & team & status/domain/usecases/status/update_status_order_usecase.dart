import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/status_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/repos/status_repo.dart';

class UpdateStatusOrderUsecase
    extends UseCase<Future<Either<Failure, Unit>>, UpdateStatusOrderParam> {
  final StatusRepo statusRepo;

  UpdateStatusOrderUsecase(this.statusRepo);

  @override
  Future<Either<Failure, Unit>> call(UpdateStatusOrderParam param) {
    return statusRepo.updateStatusOrder(param);
  }
}
