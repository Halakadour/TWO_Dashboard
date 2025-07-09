import 'package:flutter/material.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project_card.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/task_status_title_and_task_count.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/theme/color.dart';

class ProjectKanbanView extends StatefulWidget {
  const ProjectKanbanView({super.key});

  @override
  State<ProjectKanbanView> createState() => _ProjectKanbanViewState();
}

class _ProjectKanbanViewState extends State<ProjectKanbanView> {
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

        final projectStatuses = [
          WorkStatus.pended,
          WorkStatus.inProgress,
          WorkStatus.inReview,
          WorkStatus.completed,
          WorkStatus.canceled,
        ];

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
                  projectStatuses.map((status) {
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
  Widget _buildKanbanColumn(WorkStatus projectStatus) {
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
              title: HelperFunctions.getWorkStatusTitle(projectStatus),
              colorState: HelperFunctions.getWorkStatusColor(projectStatus),
              count: "3",
            ),
            PaddingConfig.h16,
            PaddingConfig.h16,
            // Project List
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView(
                children: List.generate(
                  4,
                  (index) => ProjectCard(
                    colorStatus: HelperFunctions.getWorkStatusColor(
                      projectStatus,
                    ),
                  ),
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
