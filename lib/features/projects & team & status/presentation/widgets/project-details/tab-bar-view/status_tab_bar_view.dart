import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/update_elevated_button.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project_kanban_view.dart';

class StatusTabBarView extends StatelessWidget {
  const StatusTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateElevatedButton(
                  addingType: "New Status",
                  onPressed: () {},
                ),
                PaddingConfig.w8,
                UpdateElevatedButton(
                  updateType: "Status Order",
                  onPressed: () {},
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
