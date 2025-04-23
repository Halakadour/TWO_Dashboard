import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/add_somthing_button.dart';
import 'package:two_dashboard/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_dashboard/core/widgets/dialog/contract/contracts_dialogs.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';

class CustomContractTable extends StatefulWidget {
  const CustomContractTable({super.key, required this.contrcatList});
  final List<ContractEntity> contrcatList;

  @override
  State<CustomContractTable> createState() => _CustomContractTableState();
}

class _CustomContractTableState extends State<CustomContractTable> {
  String? signature;
  void updateBytes(String? bytes) {
    setState(() {
      signature = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.frame_1, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Client Name"),
            ],
          ),
        ),
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
              Icon(Iconsax.signpost, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Client Sign"),
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
        widget.contrcatList.length,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(Center(child: Text(widget.contrcatList[index].clientId))),
            DataCell(
              Center(child: Text(widget.contrcatList[index].contractPath)),
            ),
            DataCell(
              Center(
                child:
                    (widget.contrcatList[index].clientSign == null)
                        ? Text("null")
                        : FetchNetworkImage(
                          imagePath: widget.contrcatList[index].clientSign!,
                        ),
              ),
            ),
            DataCell(
              Center(
                child: AddSomthingButton(
                  something: "Sign",
                  onTap: () {
                    ContractsDialogs().addSignatureDialog(
                      context,
                      int.parse(widget.contrcatList[index].clientId),
                      signature,
                      updateBytes,
                    );
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
