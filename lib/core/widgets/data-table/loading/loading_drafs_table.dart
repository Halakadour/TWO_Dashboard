import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_data_table.dart';
import 'package:two_dashboard/core/widgets/shimmers/shimmer_table_item.dart';

class LoadingDrafsTable extends StatelessWidget {
  const LoadingDrafsTable({super.key});

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
        3,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(Center(child: ShimmerTableItem())),
            DataCell(Center(child: ShimmerTableItem())),
            DataCell(Center(child: ShimmerTableItem())),
          ],
        ),
      ),
    );
  }
}
