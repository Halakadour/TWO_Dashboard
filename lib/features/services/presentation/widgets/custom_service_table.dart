import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/edit_button.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_data_table.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/delete_button.dart';
import 'package:two_dashboard/features/services/domain/entities/service_entity.dart';
import 'package:two_dashboard/features/services/presentation/bloc/service_bloc.dart';

class CustomServiceTable extends StatelessWidget {
  const CustomServiceTable({super.key, required this.serviceList});
  final List<ServiceEntity> serviceList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
          label: Row(
            children: [
              Icon(Iconsax.hashtag, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("ID"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            children: [
              Icon(Iconsax.archive_1, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Title"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            children: [
              Icon(Iconsax.archive_1, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Description"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.gallery, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Image"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.chart_3, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Actions"),
            ],
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        serviceList.length,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(Text("${serviceList[index].idE}")),
            DataCell(Text(serviceList[index].titleE)),
            DataCell(Text(serviceList[index].descriptionE)),
            DataCell(
              Center(
                child: FetchNetworkImage(imagePath: serviceList[index].imageE),
              ),
            ),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EditButton(
                    onTap: () {
                      context.pushNamed(
                        AppRouteConfig.updateService,
                        pathParameters: {
                          'id': serviceList[index].idE.toString(),
                          'title': serviceList[index].titleE,
                          'description': serviceList[index].descriptionE,
                          'image': serviceList[index].imageE,
                        },
                      );
                    },
                  ),
                  PaddingConfig.w8,
                  DeleteButton(
                    onTap: () {
                      context.read<ServiceBloc>().add(
                        DeleteServiceEvent(
                          serviceId: serviceList[index].idE.toString(),
                        ),
                      );
                      context.read<ServiceBloc>().add(ShowServicesEvent());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
