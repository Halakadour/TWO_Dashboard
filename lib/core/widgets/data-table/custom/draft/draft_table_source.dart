import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/field_status_container.dart';
import 'package:two_dashboard/core/widgets/texts/linked_text.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

import '../../../buttons/hovered-buttons/delete_button.dart';

class DraftRows extends DataTableSource {
  final List<DraftEntity?> draftList;
  BuildContext context;

  DraftRows({required this.draftList, required this.context});
  @override
  DataRow? getRow(int index) {
    final draft = draftList[index];
    return DataRow2(
      onTap: () {},
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(LinkedText(link: draft!.draftPath)),
        DataCell(
          (draft.approvedStatus == 0)
              ? FieldStatusContainer(fieldStatus: FieldStatus.unApproved)
              : FieldStatusContainer(fieldStatus: FieldStatus.approved),
        ),
        DataCell(
          DeleteButton(
            onTap: () {
              context.read<ContractBloc>().add(
                DeleteDrafEvent(drafId: draft.draftId),
              );
              context.read<ContractBloc>().add(GetDrafEvent());
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => draftList.length;

  @override
  int get selectedRowCount => 0;
}
