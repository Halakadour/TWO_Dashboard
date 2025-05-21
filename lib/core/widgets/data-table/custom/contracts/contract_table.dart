import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/contracts/contract_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';

class ContractTable extends StatelessWidget {
  const ContractTable({super.key, required this.contractList});
  final List<ContractEntity?> contractList;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text("Client")),
        DataColumn2(label: Text("Name")),
        DataColumn2(label: Text("Contract")),
        DataColumn2(label: Text("Client Sign")),
        DataColumn2(label: Text("Actions")),
      ],
      source: ContractRows(contractList: contractList, context: context),
    );
  }
}
