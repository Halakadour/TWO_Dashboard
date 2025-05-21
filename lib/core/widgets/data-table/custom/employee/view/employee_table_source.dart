import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/approved_button.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/field_status_container.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/texts/linked_text.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

class EmployeeRows extends DataTableSource {
  final List<EmployeeEntity> employeeList;
  BuildContext context;

  EmployeeRows({required this.employeeList, required this.context});
  @override
  DataRow? getRow(int index) {
    final employee = employeeList[index];
    return DataRow2(
      cells: [
        DataCell(
          Text("${employee.eId}", style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(
          Text(employee.eName, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(
          Text(employee.eEmail, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(
          FetchNetworkImage(
            height: 50,
            width: 50,
            shape: BoxShape.circle,
            imagePath: employee.eImage,
          ),
        ),
        DataCell(
          Text(employee.eRole, style: AppTextStyle.dataTableCellStyle()),
        ),
        DataCell(LinkedText(link: employee.eCv)),
        DataCell(FieldStatusContainer(fieldStatus: FieldStatus.approved)),
        DataCell(
          ApprovedButton(
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
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => employeeList.length;

  @override
  int get selectedRowCount => 0;
}
