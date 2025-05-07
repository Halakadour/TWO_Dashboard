import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/okay_elevated_button.dart';

void showSuccessDialog(BuildContext context, void Function()? onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: SizesConfig.dialogMd,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                JsonPath.success,
                width: 150,
                height: 150,
                repeat: true,
              ),
              PaddingConfig.h16,
              Text(
                "Success",
                style: AppTextStyle.heading04(color: AppColors.greenShade2),
              ),
              PaddingConfig.h24,
              OkayElevatedButton(onPressed: onPressed),
            ],
          ),
        ),
      );
    },
  );
}
