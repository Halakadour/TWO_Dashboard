import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/yes_text_botton.dart';

class GlobalDialogs {
  Future<dynamic> confirmDeletionDialog(
    BuildContext context,
    String deleteItemName,
    void Function()? onPressed,
  ) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Are you sure you want to delete $deleteItemName ?",
              style: AppTextStyle.bodyLg(color: AppColors.redShade2),
            ),
            actions: [
              const CancelTextButton(),
              YesTextBotton(onPressed: onPressed),
            ],
          ),
    );
  }
}
