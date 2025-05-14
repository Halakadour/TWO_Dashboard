import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/dashboard/presentation/widgets/task_table_source.dart';
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
        DataColumn2(label: Text("Task ID")),
        DataColumn2(label: Text("Title")),
        DataColumn2(label: Text("Description")),
        DataColumn2(label: Text("Status")),
        DataColumn2(label: Text("Priority")),
      ],
      source: TaskRows(
        taskList: [
          TaskEntity(
            id: 0,
            title: "test",
            description: "test",
            projectName: "test",
            projectId: 0,
            sprintName: "test",
            sprintId: 0,
            taskStatus: TaskStatus.inProgress,
            assignedTo: "front",
            priority: Priority.low,
            completion: 0.5,
            startDate: DateTime(2025, 5, 12),
            endDate: DateTime(2025, 6, 14),
          ),
          TaskEntity(
            id: 0,
            title: "test",
            description: "test",
            projectName: "test",
            projectId: 0,
            sprintName: "test",
            sprintId: 0,
            taskStatus: TaskStatus.canceled,
            assignedTo: "front",
            priority: Priority.medium,
            completion: 0.5,
            startDate: DateTime(2025, 5, 12),
            endDate: DateTime(2025, 6, 14),
          ),
          TaskEntity(
            id: 0,
            title: "test",
            description: "test",
            projectName: "test",
            projectId: 0,
            sprintName: "test",
            sprintId: 0,
            taskStatus: TaskStatus.toDo,
            assignedTo: "front",
            priority: Priority.high,
            completion: 0.5,
            startDate: DateTime(2025, 5, 12),
            endDate: DateTime(2025, 6, 14),
          ),
        ],
      ),
    );
  }
}
