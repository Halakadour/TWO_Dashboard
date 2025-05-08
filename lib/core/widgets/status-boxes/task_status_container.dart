import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';

class TaskStatusContainer extends StatelessWidget {
  const TaskStatusContainer({super.key, required this.priority});
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    return _buildTaskStatusWidget();
  }

  Widget _buildTaskStatusWidget() {
    Widget taskStatusWidget;
    switch (priority) {
      case Priority.low:
        taskStatusWidget = _buildLowPriority();
        break;
      case Priority.medium:
        taskStatusWidget = _buildMediumPriority();
        break;
      case Priority.high:
        taskStatusWidget = _buildHighPriority();
        break;
    }
    return taskStatusWidget;
  }

  final double width = 80;
  final double height = 30;
  // On Low
  Widget _buildLowPriority() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.yellowShade1,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
            child: CircleAvatar(backgroundColor: AppColors.yellowShade2),
          ),
          PaddingConfig.w8,
          Text(
            "Low",
            style: AppTextStyle.subtitle04(color: AppColors.yellowShade2),
          ),
        ],
      ),
    );
  }

  // On Medium
  Widget _buildMediumPriority() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.blueShade1,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
            child: CircleAvatar(backgroundColor: AppColors.blueShade2),
          ),
          PaddingConfig.w8,
          Text(
            "Medium",
            style: AppTextStyle.subtitle04(color: AppColors.blueShade2),
          ),
        ],
      ),
    );
  }

  // On High
  Widget _buildHighPriority() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.redShade1,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
            child: CircleAvatar(backgroundColor: AppColors.redShade2),
          ),
          PaddingConfig.w8,
          Text(
            "High",
            style: AppTextStyle.subtitle04(color: AppColors.redShade2),
          ),
        ],
      ),
    );
  }
}
