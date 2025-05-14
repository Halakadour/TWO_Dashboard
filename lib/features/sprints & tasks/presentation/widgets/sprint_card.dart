import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/dialog/sprint/sprint_dialog.dart';
import 'package:two_dashboard/core/widgets/images/group_of_image_circle.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../core/network/enums.dart';
import '../../../../core/widgets/container/status-containers/priority_container.dart';
import 'comments_box.dart';
import 'custom_progress_bar.dart';

class SprintCard extends StatelessWidget {
  const SprintCard({super.key, required this.colorStatus});
  final Color colorStatus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SprintDialog().showSprintDetails(context);
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
            // Image.asset(
            //   ImagesPath.design,
            //   height: 180,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
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
                    style: AppTextStyle.bodyLg(),
                  ),
                  // Due Date
                  Text(
                    'September 8, 2025',
                    style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                  ),
                  PaddingConfig.h16,
                  // Progress Bar
                  CustomProgressBar(colorStatus: colorStatus),
                  PaddingConfig.h16,
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // user image
                        Expanded(
                          child: GroupOfImageCircle(
                            imagePaths: ["", "", "", "", "", ""],
                          ),
                        ),
                        Row(
                          children: [
                            CommentsBox(),
                            PaddingConfig.w8,
                            PriorityContainer(priority: Priority.low),
                          ],
                        ),
                      ],
                    ),
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
