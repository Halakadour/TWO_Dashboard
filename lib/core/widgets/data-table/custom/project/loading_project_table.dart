import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/core/widgets/data-table/loading/loading_rows.dart';

class LoadingProjectTable extends StatelessWidget {
  const LoadingProjectTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text("Project Type")),
        DataColumn2(label: Text("Status")),
        DataColumn2(label: Text("Visibility")),
        DataColumn2(label: Text("Description")),
        DataColumn2(label: Text("Cost")),
        DataColumn2(label: Text("Duration")),
        DataColumn2(label: Text("Requirements")),
        DataColumn2(label: Text("Documents")),
        DataColumn2(label: Text("Coopertion Type")),
        DataColumn2(label: Text("Actions")),
      ],
      source: LoadingRows(cellsCount: 10),
    );
  }
}
