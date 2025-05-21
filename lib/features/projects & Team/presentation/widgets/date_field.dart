import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../config/theme/text_style.dart';
import '../../../../core/helper/helper_functions.dart';
import '../../../../core/widgets/container/custom_rounder_container.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.label,
    this.date,
    required this.onTap,
  });
  final String label;
  final DateTime? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.bodySm()),
        PaddingConfig.h8,
        GestureDetector(
          onTap: onTap,
          child: CustomRounderContainer(
            showBorder: true,
            showShadow: false,
            borderColor: AppColors.grayShade2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date != null ? HelperFunctions.formatDate(date!) : label,
                  style: AppTextStyle.bodySm(
                    color:
                        date != null
                            ? AppColors.black
                            : AppColors.fontLightGray,
                  ),
                ),
                const Icon(Iconsax.calendar_1, size: SizesConfig.iconsSm),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
