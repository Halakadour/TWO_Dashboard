import 'package:flutter/material.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/add_new_sprint_button.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/sprint_card.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/sprint_status_title_and_task_count.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';

class SprintKanbanView extends StatefulWidget {
  const SprintKanbanView({super.key});

  @override
  State<SprintKanbanView> createState() => _SprintKanbanViewState();
}

class _SprintKanbanViewState extends State<SprintKanbanView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildKanbanColumn('To Do', AppColors.yellowShade2),
        PaddingConfig.w16,
        _buildKanbanColumn('In Progress', AppColors.blueShade2),
        PaddingConfig.w16,

        _buildKanbanColumn('In Review', AppColors.rockShade2),
        PaddingConfig.w16,

        _buildKanbanColumn('Done', AppColors.greenShade2),
      ],
    );
  }

  // Kanban Column
  Widget _buildKanbanColumn(String title, Color colorState) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
          //border: Border.all(color: AppColors.gray, width: 0.8),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            // Task status and number
            SprintStatusTitleAndSprintCount(
              title: title,
              colorState: colorState,
              count: "3",
            ),
            PaddingConfig.h16,
            // Add Task Button
            AddNewSprintButton(),
            PaddingConfig.h16,
            // Tasks List
            Expanded(
              child: ListView(
                children: List.generate(
                  2,
                  (index) => SprintCard(colorStatus: colorState),
                ),
              ),
            ),
            PaddingConfig.h16,
          ],
        ),
      ),
    );
  }
}
