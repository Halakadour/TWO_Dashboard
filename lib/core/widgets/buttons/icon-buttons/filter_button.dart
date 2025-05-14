import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: -2),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.rockshade1, width: .4),
          borderRadius: BorderRadius.circular(SizesConfig.buttonRadius),
        ),
      ),
      onPressed: onPressed,
      icon: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Iconsax.filter,
            size: SizesConfig.iconsSm,
            color: AppColors.rockShade2,
          ),
          PaddingConfig.w8,
          Text(
            "Filter",
            style: AppTextStyle.buttonStyle(color: AppColors.rockShade2),
          ),
        ],
      ),
    );
  }
}
