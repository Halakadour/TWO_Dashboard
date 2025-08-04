import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/sprint_bloc_state_handling.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/dynamic_status_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/priority_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/task_status_container.dart';
import 'package:two_dashboard/core/widgets/images/image_circle.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/sprint/sprint.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/data/models/task/task_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

class BacklogCard extends StatelessWidget {
  const BacklogCard({
    super.key,
    required this.team,
    required this.sprint,
    required this.projectId,
    required this.showButton,
  });
  final Team? team;
  final Sprint sprint;
  final int projectId;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => context.pushNamed(
            AppRouteConfig.sprintDetails,
            extra: SprintEntity(
              id: sprint.id,
              projectId: sprint.projectId,
              label: sprint.label,
              description: sprint.description,
              goal: sprint.goal,
              start: sprint.start,
              end: sprint.end,
              sprintStatus: sprint.status,
              incompleteTasksCount: sprint.incompleteTasksCount,
            ),
          ),
      child: CustomRounderContainer(
        backgroundColor: AppColors.grayshade1,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Iconsax.arrow_down_1),
                    PaddingConfig.w8,
                    Text(sprint.label),
                    PaddingConfig.w8,
                    DynamicStatusContainer(status: "0"),
                  ],
                ),
                Row(
                  children: [
                    DynamicStatusContainer(
                      status:
                          sprint.tasks
                              .where(
                                (element) =>
                                    element.status.toLowerCase().contains('do'),
                              )
                              .toList()
                              .length
                              .toString(),
                      color: AppColors.yellowShade1,
                      fontColor: AppColors.yellowShade2,
                    ),
                    PaddingConfig.w8,
                    DynamicStatusContainer(
                      status:
                          sprint.tasks
                              .where(
                                (element) =>
                                    element.status.toLowerCase().contains('pr'),
                              )
                              .toList()
                              .length
                              .toString(),
                      color: AppColors.blueShade1,
                      fontColor: AppColors.blueShade2,
                    ),
                    PaddingConfig.w8,
                    DynamicStatusContainer(
                      status:
                          sprint.tasks
                              .where(
                                (element) =>
                                    element.status.toLowerCase().contains('co'),
                              )
                              .toList()
                              .length
                              .toString(),
                      color: AppColors.greenShade1,
                      fontColor: AppColors.greenShade2,
                    ),
                    PaddingConfig.w8,
                    if (showButton)
                      BlocListener<SprintAndTaskBloc, SprintAndTaskState>(
                        listener: (context, state) {
                          SprintBlocStateHandling().startSprintListener(
                            state,
                            context,
                            projectId,
                          );
                        },
                        listenWhen:
                            (previous, current) =>
                                previous.startSprintStatus !=
                                current.startSprintStatus,
                        child: StartSprintOutLineButton(
                          projectId: projectId,
                          sprint: sprint,
                        ),
                      ),
                    PaddingConfig.w8,
                    Icon(Iconsax.more),
                  ],
                ),
              ],
            ),
            PaddingConfig.h16,
            SizedBox(
              height: 175,
              child: ListView.builder(
                itemCount: sprint.tasks.length,
                itemBuilder:
                    (context, index) =>
                        BacklogTaskListTile(task: sprint.tasks[index]),
              ),
            ),
            PaddingConfig.h16,
            GestureDetector(
              onTap:
                  () => context.pushNamed(
                    AppRouteConfig.createTask,
                    extra: team,
                    pathParameters: {
                      'projectId': projectId.toString(),
                      'sprintId': sprint.id.toString(),
                    },
                  ),
              child: Row(
                children: [Icon(Iconsax.add), PaddingConfig.w8, Text("Create")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BacklogTaskListTile extends StatelessWidget {
  const BacklogTaskListTile({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRouteConfig.taskDetails, extra: task),
      child: CustomRounderContainer(
        margin: EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [Icon(Iconsax.tag), PaddingConfig.w8, Text(task.title)],
            ),
            TaskStatusContainer(
              taskStatus: HelperFunctions.getTaskStatusByName(task.status),
            ),
            PriorityContainer(
              priority: HelperFunctions.getPriorityByName(task.priority),
            ),
            ImageCircle(),
            Icon(Iconsax.more),
          ],
        ),
      ),
    );
  }
}

class StartSprintOutLineButton extends StatelessWidget {
  const StartSprintOutLineButton({
    super.key,
    required this.projectId,
    required this.sprint,
  });

  final int projectId;
  final Sprint sprint;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.grayShade2, width: 0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(SizesConfig.buttonRadius),
        ),
      ),
      onPressed: () {
        context.read<SprintAndTaskBloc>().add(
          StartSprintEvent(projectId: projectId, sprintId: sprint.id),
        );
      },
      child: Text("Start Sprint", style: AppTextStyle.buttonStyle()),
    );
  }
}
