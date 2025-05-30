import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class ErrorStatusAnimation extends StatelessWidget {
  const ErrorStatusAnimation({super.key, required this.errorMessage});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Lottie.asset(JsonPath.networkError),
        ),
        PaddingConfig.w16,
        Text(
          errorMessage,
          style: AppTextStyle.bodySm(color: AppColors.blueShade2),
        ),
      ],
    );
  }
}
