import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/complete_sprint_elevated_button.dart';
import 'package:two_dashboard/core/widgets/dropdown-list/sprint_selection_dropdowm_list.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/project_sprint.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

void showCompleteSprintDialog(
  BuildContext context, {
  required SprintEntity sprint,
  required List<ProjectSprint> sprints,
}) {
  Map<String, dynamic>? selectedAction;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Complete ${sprint.label}', style: AppTextStyle.bodyLg()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "This sprint contains ${sprint.incompleteTasksCount} open work items.",
              style: AppTextStyle.bodyMd(),
            ),
            PaddingConfig.h16,
            SprintSelectionDropdown(
              cachedSprints: sprints,
              openTasksCount: sprint.incompleteTasksCount,
              onActionSelected: (data) {
                selectedAction = data;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          CompleteSprintElevatedButton(
            onPressed: () {
              if (selectedAction != null || sprint.incompleteTasksCount == 0) {
                final actionData = selectedAction ?? {'action': 'auto'};

                // بناء الحدث حسب البيانات المختارة
                context.read<SprintAndTaskBloc>().add(
                  CompleteSprintEvent(
                    projectId: sprint.projectId,
                    sprintId: sprint.id,
                    action: actionData['action'],
                    newSprintLabel: actionData['new_sprint_label'],
                    existingSprintId: actionData['existing_sprint_id'],
                  ),
                );

                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("يرجى تحديد أين تنقل المهام المفتوحة"),
                  ),
                );
              }
            },
          ),
        ],
      );
    },
  );
}
