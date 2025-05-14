import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/images/group_of_image_circle.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../core/network/enums.dart';
import '../../../../core/widgets/dialog/sprint/sprint_dialog.dart';
import '../../../../core/widgets/container/status-containers/priority_container.dart';
import 'comments_box.dart';
import 'custom_progress_bar.dart';

class SprintListTile extends StatelessWidget {
  const SprintListTile({super.key, required this.colorStatus});
  final Color colorStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SprintDialog().showSprintDetails(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        clipBehavior: Clip.hardEdge,
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
                Text('Marking Mobile UI Design', style: AppTextStyle.bodyLg()),
                // Start Date
                Text(
                  'September 8, 2025',
                  style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                ),
              ],
            ),
            PriorityContainer(priority: Priority.medium),
            CustomProgressBar(colorStatus: colorStatus),
            CommentsBox(),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: SizedBox(
                width: 100,
                child: GroupOfImageCircle(imagePaths: ["", "", "", "", "", ""]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
