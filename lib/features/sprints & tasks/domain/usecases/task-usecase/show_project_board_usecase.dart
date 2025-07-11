import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/task_repo.dart';

class ShowProjectBoardUsecase
    extends
        UseCase<
          Future<Either<Failure, List<StatusModel>>>,
          ShowProjectBoardParam
        > {
  final TaskRepo taskRepo;

  ShowProjectBoardUsecase(this.taskRepo);

  @override
  Future<Either<Failure, List<StatusModel>>> call(ShowProjectBoardParam param) {
    return taskRepo.showProjectBoard(param);
  }
}
