import 'package:flutter/material.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/status/status_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/task_board_card.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/task_status_title_and_task_count.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';

class StatusKanbanView extends StatefulWidget {
  const StatusKanbanView({super.key, required this.statusList});
  final List<StatusModel> statusList;

  @override
  State<StatusKanbanView> createState() => _StatusKanbanViewState();
}

class _StatusKanbanViewState extends State<StatusKanbanView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        int columnsCount;

        if (width >= 1000) {
          columnsCount = 4; // ديسك توب
        } else if (width >= 600) {
          columnsCount = 2; // تابلت
        } else {
          columnsCount = 1; // موبايل
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: columnsCount * 300, // عرض الأعمدة
            ),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children:
                  widget.statusList.map((status) {
                    return SizedBox(
                      width: width / columnsCount - 20, // عرض العمود
                      child: _buildKanbanColumn(status),
                    );
                  }).toList(),
            ),
          ),
        );
      },
    );
  }

  // Kanban Column
  Widget _buildKanbanColumn(StatusModel projectStatus) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(SizesConfig.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
          border: Border.all(color: AppColors.gray, width: 0.8),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            // Project status and number
            TaskStatusTitleAndTaskCount(
              title: projectStatus.name,
              colorState: HelperFunctions.getTaskStatusColor(
                HelperFunctions.getTaskStatusByName(projectStatus.name),
              ),
              count: projectStatus.tasks.length.toString(),
            ),
            PaddingConfig.h16,
            PaddingConfig.h16,
            // Project List
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: List.generate(
                  projectStatus.tasks.length,
                  (index) =>
                      TaskBoardCard(taskEntity: projectStatus.tasks[index]),
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
