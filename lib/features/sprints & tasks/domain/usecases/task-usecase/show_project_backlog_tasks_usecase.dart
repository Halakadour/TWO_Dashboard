import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/repos/task_repo.dart';

class ShowProjectBacklogTasksUsecase extends UseCase {
  final TaskRepo taskRepo;

  ShowProjectBacklogTasksUsecase(this.taskRepo);

  @override
  call(param) {
    return taskRepo.showProjectBackLogTasks(param);
  }
}
