import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/core/widgets/data-table/loading/loading_rows.dart';

class LoadingPostRepliesTable extends StatelessWidget {
  const LoadingPostRepliesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text("Name")),
        DataColumn2(label: Text("Email")),
        DataColumn2(label: Text("Phone")),
        DataColumn2(label: Text("CV")),
        DataColumn2(label: Text("Actions")),
      ],
      source: LoadingRows(cellsCount: 5),
    );
  }
}
