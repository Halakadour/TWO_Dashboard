import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/approved_button.dart';
import 'package:two_dashboard/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUserTable extends StatelessWidget {
  const CustomUserTable({super.key, required this.employeeList});
  final List<EmployeeEntity> employeeList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
          label: Row(
            children: [
              Icon(Iconsax.hashtag, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Id"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.frame_1, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Name"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.message, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Email"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.image, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Image"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.document, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Role"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.dcube, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Cv"),
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
        employeeList.length,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(Center(child: Text("${employeeList[index].eId}"))),
            DataCell(Center(child: Text(employeeList[index].eName))),
            DataCell(Center(child: Text(employeeList[index].eEmail))),
            DataCell(
              Center(
                child: FetchNetworkImage(
                  imagePath: employeeList[index].eImage!,
                ),
              ),
            ),
            DataCell(Center(child: Text(employeeList[index].eRole))),
            DataCell(
              (employeeList[index].eCv == null)
                  ? Center(child: Text("No CV"))
                  : Center(
                    child: InkWell(
                      onTap:
                          () => launchUrl(
                            Uri.parse('$baseUri/${employeeList[index].eCv!}'),
                          ),
                      child: Text(
                        employeeList[index].eCv!,
                        style: TextStyle(
                          color: AppColors.blueShade2,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
            ),
            DataCell(
              Center(
                child: ApprovedButton(
                  onTap: () {
                    context.read<AuthRoleProfileBloc>().add(
                      ToggleUserApprovedEvent(userId: employeeList[index].eId),
                    );
                    context.read<AuthRoleProfileBloc>().add(
                      ShowUsersWithFilterEvent(),
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
