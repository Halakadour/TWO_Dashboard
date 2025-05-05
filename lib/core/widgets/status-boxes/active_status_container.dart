import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class ActiveStatusContainer extends StatelessWidget {
  const ActiveStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 25,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray, width: 1.1),
        color: AppColors.greenShade1,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
            child: CircleAvatar(backgroundColor: AppColors.greenShade2),
          ),
          Text(
            "Active",
            style: AppTextStyle.subtitle04(color: AppColors.greenShade2),
          ),
        ],
      ),
    );
  }
}
