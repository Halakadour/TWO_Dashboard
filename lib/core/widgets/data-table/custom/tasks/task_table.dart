import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/tasks/task_table_source.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

class TaskTable extends StatelessWidget {
  const TaskTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 1.2,
      columns: [
        DataColumn2(label: Text(TextStrings.id)),
        DataColumn2(label: Text(TextStrings.title)),
        DataColumn2(label: Text(TextStrings.description)),
        DataColumn2(label: Text(TextStrings.status)),
        DataColumn2(label: Text(TextStrings.priority)),
      ],
      source: TaskRows(
        taskList: [
          TaskEntity(
            id: 0,
            title: "test",
            description: "test",
            taskStatus: WorkStatus.inProgress,
            assignedTo: "front",
            tPriority: Priority.low,
            tCompletion: 0.5,
            startDate: DateTime(2025, 5, 12),
            endDate: DateTime(2025, 6, 14),
          ),
          TaskEntity(
            id: 0,
            title: "test",
            description: "test",
            taskStatus: WorkStatus.canceled,
            assignedTo: "front",
            tPriority: Priority.medium,
            tCompletion: 0.5,
            startDate: DateTime(2025, 5, 12),
            endDate: DateTime(2025, 6, 14),
          ),
          TaskEntity(
            id: 0,
            title: "test",
            description: "test",
            taskStatus: WorkStatus.toDo,
            assignedTo: "front",
            tPriority: Priority.high,
            tCompletion: 0.5,
            startDate: DateTime(2025, 5, 12),
            endDate: DateTime(2025, 6, 14),
          ),
        ],
      ),
    );
  }
}
