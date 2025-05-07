import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/choose_date_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: PageTemplate(
        child: Column(
          children: [
            PageTitle(pageTitle: "Tasks"),
            PaddingConfig.h16,
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(SizesConfig.borderRadiusLg),
              ),
              padding: EdgeInsets.all(SizesConfig.md),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ChooseDateButton(),
                      PaddingConfig.w8,
                      FilterButton(onPressed: () {}),
                      PaddingConfig.w8,
                      //ToggleButton(),
                    ],
                  ),
                  PaddingConfig.h16,
                  Row(
                    children: [
                      TaskBox(taskBoxTitle: "To Do"),
                      PaddingConfig.w8,

                      TaskBox(taskBoxTitle: "In Progress"),
                      PaddingConfig.w8,

                      TaskBox(taskBoxTitle: "In Review"),
                      PaddingConfig.w8,

                      TaskBox(taskBoxTitle: "Done"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskBox extends StatelessWidget {
  const TaskBox({super.key, required this.taskBoxTitle});
  final String taskBoxTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.fontLightColor, width: .3),
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(taskBoxTitle),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: SizesConfig.sm),
                  decoration: BoxDecoration(
                    color: AppColors.greenShade1,
                    borderRadius: BorderRadius.circular(
                      SizesConfig.borderRadiusXs,
                    ),
                  ),
                  child: Text("3"),
                ),
              ],
            ),
            PaddingConfig.h16,
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: SizesConfig.md,
                vertical: SizesConfig.sm,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.fontLightColor, width: .3),
                borderRadius: BorderRadius.circular(SizesConfig.borderRadiusXl),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.add),
                  PaddingConfig.w16,
                  Text("Add New Task"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
