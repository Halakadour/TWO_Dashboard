import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/delete_button.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/field_status_container.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_data_table.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

class CustomDraftTable extends StatelessWidget {
  const CustomDraftTable({super.key, required this.draftsList});
  final List<DraftEntity> draftsList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.document, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Contract"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.status, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Status"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.chart_3, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Action"),
            ],
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        draftsList.length,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(Center(child: Text(draftsList[index].draftPath))),
            DataCell(
              Center(
                child:
                    (draftsList[index].approvedStatus == 0)
                        ? FieldStatusContainer(
                          fieldStatus: FieldStatus.unApproved,
                        )
                        : FieldStatusContainer(
                          fieldStatus: FieldStatus.approved,
                        ),
              ),
            ),
            DataCell(
              Center(
                child: DeleteButton(
                  onTap: () {
                    context.read<ContractBloc>().add(
                      DeleteDrafEvent(drafId: draftsList[index].draftId),
                    );
                    context.read<ContractBloc>().add(GetDrafEvent());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
