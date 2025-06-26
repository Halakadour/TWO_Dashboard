import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/features/roles/data/models/role_response_model.dart';

class CustomDropdownListForRoleModel extends StatelessWidget {
  const CustomDropdownListForRoleModel({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });
  final RoleModel? value;
  final List<DropdownMenuItem<RoleModel>>? items;
  final void Function(RoleModel?)? onChanged;

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
      child: DropdownButton<RoleModel>(
        borderRadius: BorderRadius.circular(SizesConfig.md),
        isExpanded: true,
        value: value,
        underline: const SizedBox(),
        focusColor: AppColors.white,
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        elevation: 0,
        hint: Text(
          "select your Role",
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
