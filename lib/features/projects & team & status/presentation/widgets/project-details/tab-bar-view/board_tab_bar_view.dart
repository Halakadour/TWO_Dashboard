import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/complete_sprint_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project_kanban_view.dart';

class BoardTabBarView extends StatelessWidget {
  const BoardTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownMenu(
                  hintText: "Sprint",
                  trailingIcon: Icon(
                    Iconsax.arrow_down_1,
                    size: SizesConfig.iconsSm,
                  ),
                  selectedTrailingIcon: Icon(
                    Iconsax.arrow_up_2,
                    size: SizesConfig.iconsSm,
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: AppTextStyle.bodySm(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Sprint", label: "Sprint"),
                    DropdownMenuEntry(value: "Sprint", label: "Sprint"),
                    DropdownMenuEntry(value: "Sprint", label: "Sprint"),
                  ],
                ),
                Row(
                  children: [
                    CompleteSprintElevatedButton(onPressed: () {}),
                    PaddingConfig.w8,
                    FilterButton(onPressed: () {}),
                  ],
                ),
              ],
            ),
            PaddingConfig.h32,
            ProjectKanbanView(),
            PaddingConfig.h48,
          ],
        ),
      ),
    );
  }
}
