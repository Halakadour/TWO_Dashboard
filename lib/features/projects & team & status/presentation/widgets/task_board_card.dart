import 'package:flutter/material.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/widgets/images/image_circle.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../core/functions/device_utility.dart';
import '../../../../core/widgets/container/status-containers/priority_container.dart';
import 'custom_progress_bar.dart';

class TaskBoardCard extends StatelessWidget {
  const TaskBoardCard({super.key, required this.taskEntity});
  final TaskEntity taskEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.grayshade1,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaddingConfig.h16,
            // Task Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Task Title
                  Text(taskEntity.title, style: AppTextStyle.bodyLg()),
                  // Due Date
                  Text(
                    HelperFunctions.formatDate(taskEntity.endDate),
                    style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                  ),
                  PaddingConfig.h16,
                  // Progress Bar
                  CustomProgressBar(
                    lintWidth:
                        DeviceUtility.isMobileScreen(context)
                            ? DeviceUtility.getScreenWidth(context) * 0.45
                            : DeviceUtility.getScreenWidth(context) * 0.12,
                    value: taskEntity.taskCompletion,
                  ),
                  PaddingConfig.h16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImageCircle(),
                      PriorityContainer(priority: taskEntity.taskPriority),
                    ],
                  ),
                  PaddingConfig.h16,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
