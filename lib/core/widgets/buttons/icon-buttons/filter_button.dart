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
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.rockshade1, width: .3),
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusXl),
        ),
      ),
      onPressed: onPressed,
      icon: Row(
        children: [
          const Icon(
            Iconsax.candle_2,
            size: SizesConfig.iconsSm,
            color: AppColors.rockShade2,
          ),
          PaddingConfig.w8,
          Text(
            "Filter",
            style: AppTextStyle.subtitle03(color: AppColors.rockShade2),
          ),
        ],
      ),
    );
  }
}
