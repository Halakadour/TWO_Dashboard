import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';

import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key, required this.lintWidth});
  final double lintWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: lintWidth,
          child: LinearProgressIndicator(
            value: 0.5,
            trackGap: 2,
            backgroundColor: AppColors.greenShade1,
            color: AppColors.greenShade2,
            minHeight: 8.0,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        PaddingConfig.w8,
        Text('%20', style: AppTextStyle.bodySm(color: AppColors.fontLightGray)),
      ],
    );
  }
}
