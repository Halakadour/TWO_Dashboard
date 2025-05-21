import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/add_somthing_button.dart';
import 'package:two_dashboard/core/widgets/texts/linked_text.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';

import '../../../images/fetch_network_image.dart';

class ContractRows extends DataTableSource {
  final List<ContractEntity?> contractList;
  BuildContext context;

  ContractRows({required this.contractList, required this.context});
  @override
  DataRow? getRow(int index) {
    final contract = contractList[index];
    return DataRow2(
      onTap: () {},
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(FetchNetworkImage(imagePath: contract!.clientImage)),
        DataCell(
          Text(contract.clientName, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(LinkedText(link: contract.contractPath)),
        DataCell(FetchNetworkImage(imagePath: contract.clientSign)),
        DataCell(
          AddSomthingButton(
            something: "Sign",
            onTap: () {
              context.pushNamed(
                AppRouteConfig.addSign,
                pathParameters: {'id': contract.clientID},
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => contractList.length;

  @override
  int get selectedRowCount => 0;
}
