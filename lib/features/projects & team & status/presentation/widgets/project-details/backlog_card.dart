import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/dynamic_status_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/task_status_container.dart';
import 'package:two_dashboard/core/widgets/images/image_circle.dart';

class BacklogCard extends StatelessWidget {
  const BacklogCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomRounderContainer(
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
                  Text(title),
                  PaddingConfig.w8,
                  DynamicStatusContainer(status: "0"),
                ],
              ),
              Row(
                children: [
                  DynamicStatusContainer(status: "0"),
                  PaddingConfig.w8,
                  DynamicStatusContainer(status: "0"),
                  PaddingConfig.w8,
                  DynamicStatusContainer(status: "0"),
                  PaddingConfig.w8,
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.grayShade2, width: 0.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(
                          SizesConfig.buttonRadius,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Complete Sprint",
                      style: AppTextStyle.buttonStyle(),
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
              itemCount: 4,
              itemBuilder:
                  (context, index) => CustomRounderContainer(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Iconsax.tag),
                            PaddingConfig.w8,
                            Text("Some Task"),
                          ],
                        ),
                        TaskStatusContainer(taskStatus: TaskStatus.toDo),
                        ImageCircle(),
                        Icon(Iconsax.more),
                      ],
                    ),
                  ),
            ),
          ),
          PaddingConfig.h16,
          Row(children: [Icon(Iconsax.add), PaddingConfig.w8, Text("Create")]),
        ],
      ),
    );
  }
}
