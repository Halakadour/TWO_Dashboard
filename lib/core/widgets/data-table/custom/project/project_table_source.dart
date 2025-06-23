import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/edit_button.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/project_status_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/visibility_status_container.dart';
import 'package:two_dashboard/core/widgets/dialog/sprint/sprint_dialog.dart';
import 'package:two_dashboard/core/widgets/texts/linked_text.dart';
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
        SprintDialog().showProjectDetails(context, project);
      },
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(
          Text(project.pType.name, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(ProjectStatusContainer(projectStatus: project.status)),
        DataCell(VisibilityStatusContainer(visibility: project.visibility)),
        DataCell(
          Text(
            project.projectDescription,
            style: AppTextStyle.dataTableCellStyle(),
          ),
        ),
        DataCell(Text(project.cost, style: AppTextStyle.dataTableCellStyle())),
        DataCell(
          Text(project.duration, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(
          Text(project.requirements, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(LinkedText(link: project.document)),
        DataCell(
          Text(project.cType.name, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(Row(children: [EditButton(onTap: () {}), PaddingConfig.w8])),
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
