import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/dialog/task/task_dialog.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/strings/assets_path.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../core/network/enums.dart';
import '../../../../core/widgets/status-boxes/task_status_container.dart';
import 'comments_box.dart';
import 'custom_progress_bar.dart';
import 'image_circle.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.colorStatus});
  final Color colorStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TaskDialog().showTaskDetails(context);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.grayshade1,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          //border: Border.all(color: AppColors.gray, width: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // task Image
            Image.asset(
              ImagesPath.design,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            PaddingConfig.h16,
            // Task Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Task Title
                  Text(
                    'Marking Mobile UI Design',
                    style: AppTextStyle.subtitle01(),
                  ),
                  // Due Date
                  Text(
                    'September 8, 2025',
                    style: AppTextStyle.subtitle03(
                      color: AppColors.fontLightColor,
                    ),
                  ),
                  PaddingConfig.h16,
                  // Progress Bar
                  CustomProgressBar(colorStatus: colorStatus),
                  PaddingConfig.h8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // user image
                      ImageCircle(),
                      Row(
                        children: [
                          CommentsBox(),
                          PaddingConfig.w8,
                          TaskStatusContainer(priority: Priority.low),
                        ],
                      ),
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
