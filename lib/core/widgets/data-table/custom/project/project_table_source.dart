import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/delete_button.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/edit_button.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/task_status_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/visibility_status_container.dart';
import 'package:two_dashboard/core/widgets/dialog/sprint/sprint_dialog.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/project_entity.dart';

class ProjectRows extends DataTableSource {
  final List<ProjectEntity> projectList;
  BuildContext context;

  ProjectRows({required this.projectList, required this.context});
  @override
  DataRow? getRow(int index) {
    final project = projectList[index];
    return DataRow2(
      onTap: () {
        SprintDialog().showSprintDetails(context, project);
      },
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(Text(project.name, style: AppTextStyle.dataTableCellStyle())),
        DataCell(
          Text(
            "${project.contractId}",
            style: AppTextStyle.dataTableCellStyle(),
          ),
        ),
        DataCell(
          Text(
            HelperFunctions.formatDate(project.endDate),
            style: AppTextStyle.dataTableCellStyle(),
          ),
        ),
        DataCell(
          Text(
            HelperFunctions.projectDurationText(
              project.startDate,
              project.endDate,
            ),
            style: AppTextStyle.dataTableCellStyle(),
          ),
        ),
        DataCell(TaskStatusContainer(taskStatus: project.projectStatus)),
        DataCell(
          VisibilityStatusContainer(visibility: project.projectVisibility),
        ),
        DataCell(
          Text(project.team.name, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(
          Row(
            children: [
              EditButton(onTap: () {}),
              PaddingConfig.w8,
              DeleteButton(onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => projectList.length;

  @override
  int get selectedRowCount => 0;
}
