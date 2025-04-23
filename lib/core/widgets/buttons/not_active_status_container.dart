import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class NotActiveStatusContainer extends StatelessWidget {
  const NotActiveStatusContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray, width: 1.1),
        color: AppColors.redShade1,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
            child: CircleAvatar(backgroundColor: AppColors.redShade2),
          ),
          PaddingConfig.w8,
          Text(
            "Not Active",
            style: AppTextStyle.subtitle03(color: AppColors.redShade2),
          ),
        ],
      ),
    );
  }
}
