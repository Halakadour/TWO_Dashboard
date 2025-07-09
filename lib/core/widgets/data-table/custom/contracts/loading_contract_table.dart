import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/core/widgets/data-table/loading/loading_rows.dart';

class LoadingContractTable extends StatelessWidget {
  const LoadingContractTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text(TextStrings.client)),
        DataColumn2(label: Text(TextStrings.name)),
        DataColumn2(label: Text(TextStrings.contract)),
        DataColumn2(label: Text(TextStrings.clientSign)),
        DataColumn2(label: Text(TextStrings.actions)),
      ],
      source: LoadingRows(cellsCount: 5),
    );
  }
}
