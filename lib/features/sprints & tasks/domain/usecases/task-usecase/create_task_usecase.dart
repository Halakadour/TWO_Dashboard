import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/param/task_param.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/task_repo.dart';

class CreateTaskUsecase
    extends UseCase<Future<Either<Failure, Unit>>, CreateOrUpdateTaskParam> {
  CreateTaskUsecase(this.taskRepo);
  final TaskRepo taskRepo;

  @override
  Future<Either<Failure, Unit>> call(CreateOrUpdateTaskParam param) {
    return taskRepo.createTask(param);
  }
}
