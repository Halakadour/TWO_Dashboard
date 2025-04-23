import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class UnApprovedStatusContainer extends StatelessWidget {
  const UnApprovedStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray, width: 1.1),
        color: AppColors.yellowShade1,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
            child: CircleAvatar(backgroundColor: AppColors.yellowShade2),
          ),
          PaddingConfig.w8,
          Text(
            "Approved",
            style: AppTextStyle.subtitle04(color: AppColors.yellowShade2),
          ),
        ],
      ),
    );
  }
}
