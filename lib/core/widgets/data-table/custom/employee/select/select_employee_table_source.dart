import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/add_somthing_button.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/field_status_container.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/texts/linked_text.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

class SelectEmployeeRows extends DataTableSource {
  final List<EmployeeEntity> employeeList;
  final void Function(EmployeeEntity employee) onTapForManager;
  final void Function(EmployeeEntity employee) onTapForMember;
  BuildContext context;

  SelectEmployeeRows({
    required this.employeeList,
    required this.context,
    required this.onTapForManager,
    required this.onTapForMember,
  });
  @override
  DataRow? getRow(int index) {
    final employee = employeeList[index];
    return DataRow2(
      onTap: () {},
      selected: false,
      onSelectChanged: (value) {},
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
        DataCell(FieldStatusContainer(fieldStatus: FieldStatus.unApproved)),
        DataCell(
          Row(
            children: [
              AddSomthingButton(
                onTap: () => onTapForManager(employee),
                something: "Mgr",
              ),
              PaddingConfig.w8,
              AddSomthingButton(
                onTap: () => onTapForMember(employee),
                something: "Mem",
              ),
            ],
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
