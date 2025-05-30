import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';

class CustomDropdownListForDraftEntity extends StatelessWidget {
  const CustomDropdownListForDraftEntity({
    super.key,
    required this.selectYour,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  final String selectYour;
  final DraftEntity? value;
  final List<DropdownMenuItem<DraftEntity>>? items;
  final void Function(DraftEntity?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: SizesConfig.sm,
        horizontal: SizesConfig.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.fieldColor,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
      ),
      child: DropdownButton<DraftEntity>(
        borderRadius: BorderRadius.circular(SizesConfig.md),
        isExpanded: true,
        value: value,
        underline: const SizedBox(),
        focusColor: AppColors.white,
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        elevation: 0,
        hint: Text(
          "select your $selectYour",
          style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
        ),
        style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
        dropdownColor: AppColors.fieldColor,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
