import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/project/casual/project_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';

class ProjectTable extends StatelessWidget {
  const ProjectTable({super.key, required this.projectList});
  final List<ProjectEntity> projectList;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text(TextStrings.type)),
        DataColumn2(label: Text(TextStrings.status)),
        DataColumn2(label: Text(TextStrings.visibility)),
        DataColumn2(label: Text(TextStrings.cost)),
        DataColumn2(label: Text(TextStrings.duration)),
        DataColumn2(label: Text(TextStrings.documents)),
        DataColumn2(label: Text(TextStrings.coopertion)),
        DataColumn2(label: Text(TextStrings.actions)),
      ],
      source: ProjectRows(projectList: projectList, context: context),
    );
  }
}
