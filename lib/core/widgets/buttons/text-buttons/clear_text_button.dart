import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class ClearTextButton extends StatelessWidget {
  const ClearTextButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        "Clear",
        style: AppTextStyle.buttonStyle(color: AppColors.fontLightGray),
      ),
    );
  }
}
