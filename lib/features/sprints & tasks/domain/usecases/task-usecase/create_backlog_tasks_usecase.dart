import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/task_repo.dart';

class CreateBacklogTasksUsecase
    extends
        UseCase<Future<Either<Failure, Unit>>, CreateBacklogTasksSprintParam> {
  final TaskRepo taskRepo;

  CreateBacklogTasksUsecase(this.taskRepo);

  @override
  Future<Either<Failure, Unit>> call(CreateBacklogTasksSprintParam param) {
    return taskRepo.createBacklogTasksSprint(param);
  }
}
