import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';

// ignore: must_be_immutable
class RejectButton extends StatelessWidget {
  RejectButton({super.key, required this.onTap});

  final void Function()? onTap;
  ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (context) {
        isHover.value = true;
      },
      onExit: (context) {
        isHover.value = false;
      },
      child: ValueListenableBuilder(
        valueListenable: isHover,
        builder:
            (context, value, child) => InkWell(
              onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(
                  milliseconds: SizesConfig.animationDuration,
                ),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: value ? AppColors.redShade2 : Colors.transparent,
                  border: Border.all(color: AppColors.redShade2, width: 1.1),
                  shape: BoxShape.circle,
                ),
                child: Tooltip(
                  message: TextStrings.reject,
                  child: Icon(
                    Iconsax.dislike,
                    size: SizesConfig.iconsSm,
                    color: value ? AppColors.white : AppColors.redShade2,
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
