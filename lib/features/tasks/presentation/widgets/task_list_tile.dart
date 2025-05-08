import 'package:flutter/material.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../core/network/enums.dart';
import '../../../../core/widgets/dialog/task/task_dialog.dart';
import '../../../../core/widgets/status-boxes/task_status_container.dart';
import 'comments_box.dart';
import 'custom_progress_bar.dart';
import 'image_circle.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.colorStatus});
  final Color colorStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TaskDialog().showTaskDetails(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: AppColors.grayshade1,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusXl),
        ),
        padding: EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Title & Start Date
                Text(
                  'Marking Mobile UI Design',
                  style: AppTextStyle.subtitle01(),
                ),
                // Start Date
                Text(
                  'September 8, 2025',
                  style: AppTextStyle.subtitle03(
                    color: AppColors.fontLightColor,
                  ),
                ),
              ],
            ),
            TaskStatusContainer(priority: Priority.medium),
            CustomProgressBar(colorStatus: colorStatus),
            CommentsBox(),
            ImageCircle(),
          ],
        ),
      ),
    );
  }
}
