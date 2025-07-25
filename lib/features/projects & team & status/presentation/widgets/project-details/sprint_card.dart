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
import 'package:two_dashboard/core/widgets/container/status-containers/duration_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/dynamic_status_container.dart';
import 'package:two_dashboard/core/widgets/menus/sprint_side_menu.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

class SprintCard extends StatelessWidget {
  const SprintCard({
    super.key,
    required this.sprintEntity,
    required this.projectId,
  });
  final SprintEntity sprintEntity;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    final GlobalKey iconKey = GlobalKey();

    return GestureDetector(
      onTap: () => context.pushNamed(AppRouteConfig.sprintDetails),
      child: CustomRounderContainer(
        key: iconKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // For --> View, Edit, Delete
                BlocListener<SprintAndTaskBloc, SprintAndTaskState>(
                  listenWhen:
                      (previous, current) =>
                          (previous.deleteSprintStatus !=
                                  current.deleteSprintStatus ||
                              previous.startSprintStatus !=
                                  current.startSprintStatus ||
                              previous.completeSprintStatus !=
                                  current.completeSprintStatus),
                  listener: (context, state) {
                    SprintBlocStateHandling().deletSprintListener(
                      state,
                      context,
                      int.parse(projectId),
                    );
                    SprintBlocStateHandling().startSprintListener(
                      state,
                      context,
                      int.parse(projectId),
                    );
                    SprintBlocStateHandling().completeSprintListener(
                      state,
                      context,
                      int.parse(projectId),
                    );
                  },
                  child: Tooltip(
                    message: "More",
                    child: GestureDetector(
                      onTap: () {
                        showSprintCardSideMenu(
                          iconKey,
                          context,
                          sprintEntity,
                          projectId,
                        );
                      },
                      child: const Icon(Iconsax.more),
                    ),
                  ),
                ),
              ],
            ),
            PaddingConfig.h8,
            // Label
            Text(
              sprintEntity.label,
              style: AppTextStyle.bodyLg(),
              overflow: TextOverflow.ellipsis,
            ),
            PaddingConfig.h16,
            // Description
            Text(
              sprintEntity.description,
              style: AppTextStyle.bodySm(),
              overflow: TextOverflow.ellipsis,
            ),
            PaddingConfig.h16,
            // End Date
            Row(
              children: [
                Icon(
                  Iconsax.clock,
                  size: SizesConfig.iconsSm,
                  color: AppColors.gray,
                ),
                PaddingConfig.w8,
                Text(
                  "${HelperFunctions.formatDate(sprintEntity.end)} - ${TimeOfDay.fromDateTime(sprintEntity.end).format(context)}",
                  style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                ),
              ],
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Status & Duration
                DynamicStatusContainer(status: sprintEntity.sprintStatus),
                PaddingConfig.w8,
                DurationContainer(
                  startDate: sprintEntity.start,
                  endDate: sprintEntity.end,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
