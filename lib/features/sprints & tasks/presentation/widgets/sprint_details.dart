import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/divider/custom_divider.dart';
import 'package:two_dashboard/core/widgets/images/image_circle.dart';

class SprintDetails extends StatefulWidget {
  const SprintDetails({super.key});

  @override
  State<SprintDetails> createState() => _SprintDetailsState();
}

class _SprintDetailsState extends State<SprintDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizesConfig.dialogWidthXl,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButtonsRow(),
            PaddingConfig.h8,
            CustomDivider(),
            PaddingConfig.h24,
            Text('Medixa Website Design', style: AppTextStyle.headerSm()),
            PaddingConfig.h16,
            TaskDetailsColumn(),
            PaddingConfig.h8,
            CustomDivider(),
            PaddingConfig.h16,
            Text('Task Overview', style: AppTextStyle.bodyLg()),
            PaddingConfig.h8,
            Text(
              'Create high-fidelity mockups for VanHome Realty website focusing on modern UI, consistency in branding, and professional layout.',
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            PaddingConfig.h16,
            Text('Goals', style: AppTextStyle.bodyLg()),
            PaddingConfig.h8,
            Text(
              'Create high-fidelity mockups for VanHome Realty website focusing on modern UI, consistency in branding, and professional layout.',
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sub Tasks', style: AppTextStyle.bodyLg()),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See All",
                    style: AppTextStyle.bodyXs(color: AppColors.greenShade2),
                  ),
                ),
              ],
            ),
            PaddingConfig.h8,
            SubTaskRow(),
            PaddingConfig.h4,
            SubTaskRow(),
            PaddingConfig.h4,
            SubTaskRow(),
            PaddingConfig.h4,
            SubTaskRow(),
            PaddingConfig.h16,
            CustomDivider(),
            PaddingConfig.h24,
            Text('Comments', style: AppTextStyle.bodyLg()),
          ],
        ),
      ),
    );
  }
}

class SubTaskRow extends StatelessWidget {
  const SubTaskRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Desktop Version",
              style: AppTextStyle.bodySm(color: AppColors.fontDarkGray),
            ),
            Text(
              "Assigness: hala kad",
              style: AppTextStyle.bodyXs(color: AppColors.fontLightGray),
            ),
          ],
        ),
        Text(
          'Completed',
          style: AppTextStyle.bodyXs(color: AppColors.blueShade2),
        ),
      ],
    );
  }
}

class TaskDetailsColumn extends StatelessWidget {
  const TaskDetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Proirity (Low, Meduim, High)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Proirity",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 60),
            Text(
              "High",
              style: AppTextStyle.bodySm(color: AppColors.redShade2),
            ),
          ],
        ),
        PaddingConfig.h8,
        // Start Date
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Start Date",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 42),
            Text(
              "August 25, 2025",
              style: AppTextStyle.bodySm(color: AppColors.fontDarkGray),
            ),
          ],
        ),
        PaddingConfig.h8,
        // Dead Line
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Due Date",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 48),
            Text(
              "September 5, 2025",
              style: AppTextStyle.bodySm(color: AppColors.fontDarkGray),
            ),
          ],
        ),
        PaddingConfig.h8,
        // Task Status (to-Do, In-Progress, In-Reveiw, Completed)
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 66),
            Text(
              "Completed",
              style: AppTextStyle.bodySm(color: AppColors.greenShade2),
            ),
          ],
        ),
        PaddingConfig.h8,
        // Progress Bar
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Progress Bar",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 30),
            Text(
              "96%",
              style: AppTextStyle.bodySm(color: AppColors.fontDarkGray),
            ),
          ],
        ),
        PaddingConfig.h8,
        // Create By
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Created By",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 40),
            Text(
              "Hala Kad",
              style: AppTextStyle.bodySm(color: AppColors.fontDarkGray),
            ),
          ],
        ),
        PaddingConfig.h8,
        // Team
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Assignees",
              style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
            ),
            SizedBox(width: 45),
            ImageCircle(width: 25, height: 25),
          ],
        ),
      ],
    );
  }
}

class IconButtonsRow extends StatelessWidget {
  const IconButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Delete Button
            IconButton(
              icon: Row(
                children: [
                  Icon(
                    Iconsax.trash,
                    size: SizesConfig.iconsSm,
                    color: AppColors.fontLightGray,
                  ),
                  PaddingConfig.w8,
                  Text(
                    "Delete",
                    style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                  ),
                ],
              ),
              onPressed: () {},
            ),
            PaddingConfig.w16,
            // Edit Button
            IconButton(
              icon: Row(
                children: [
                  Icon(
                    Iconsax.edit,
                    size: SizesConfig.iconsSm,
                    color: AppColors.fontLightGray,
                  ),
                  PaddingConfig.w8,
                  Text(
                    "Edit",
                    style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
        // Close Button
        IconButton(
          icon: Icon(
            Iconsax.close_circle,
            size: SizesConfig.iconsSm,
            color: AppColors.fontLightGray,
          ),
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
