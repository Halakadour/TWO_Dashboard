import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/status_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/repos/status_repo.dart';

class ShowProjectBoardUsecase
    extends
        UseCase<
          Future<Either<Failure, List<StatusModel>>>,
          ShowProjectBoardParam
        > {
  final StatusRepo statusRepo;

  ShowProjectBoardUsecase(this.statusRepo);

  @override
  Future<Either<Failure, List<StatusModel>>> call(ShowProjectBoardParam param) {
    return statusRepo.showProjectBoard(param);
  }
}
