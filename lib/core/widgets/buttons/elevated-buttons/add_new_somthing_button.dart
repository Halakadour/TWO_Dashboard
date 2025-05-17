import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';

class AddNewSomthingButton extends StatelessWidget {
  const AddNewSomthingButton({
    super.key,
    required this.addingType,
    required this.onTap,
  });
  final String addingType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: SizesConfig.md,
          vertical: SizesConfig.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.fontLightGray, width: .3),
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusXl),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Iconsax.add),
            PaddingConfig.w16,
            Text("Add New $addingType"),
          ],
        ),
      ),
    );
  }
}
