import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/close_elevated_button.dart';

void notAuthorizedDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                JsonPath.fingerPrint,
                width: 120,
                height: 120,
                repeat: false,
              ),
              PaddingConfig.h16,
              Text(
                "Access Denaid",
                textAlign: TextAlign.center,
                style: AppTextStyle.heading04(color: AppColors.redShade2),
              ),
              PaddingConfig.h8,
              Text(
                "You Are Not Authorized",
                textAlign: TextAlign.center,
                style: AppTextStyle.subtitle02(color: AppColors.redShade1),
              ),
              PaddingConfig.h24,
              CloseElevatedButton(),
            ],
          ),
        ),
      );
    },
  );
}
