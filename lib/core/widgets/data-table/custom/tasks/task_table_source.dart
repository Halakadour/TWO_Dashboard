import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/priority_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/task_status_container.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

class TaskRows extends DataTableSource {
  final List<TaskEntity> taskList;

  TaskRows({required this.taskList});
  @override
  DataRow? getRow(int index) {
    final task = taskList[index];
    return DataRow2(
      onTap: () {},
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(Text("${task.id}", style: AppTextStyle.dataTableCellStyle())),
        DataCell(Text(task.title, style: AppTextStyle.dataTableCellStyle())),
        DataCell(
          Text(task.description, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(TaskStatusContainer(taskStatus: task.taskStatus)),
        DataCell(PriorityContainer(priority: task.taskPriority)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => taskList.length;

  @override
  int get selectedRowCount => 0;
}
