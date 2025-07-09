import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/draft/draft_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';

class DraftTable extends StatelessWidget {
  const DraftTable({super.key, required this.draftList});
  final List<DraftEntity?> draftList;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text(TextStrings.draft)),
        DataColumn2(label: Text(TextStrings.status)),
        DataColumn2(label: Text(TextStrings.actions)),
      ],
      source: DraftRows(draftList: draftList, context: context),
    );
  }
}
