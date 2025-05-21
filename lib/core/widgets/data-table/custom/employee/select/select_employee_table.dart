import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/employee/select/select_employee_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

class SelectEmployeeTable extends StatelessWidget {
  const SelectEmployeeTable({
    super.key,
    required this.employeeList,
    required this.onTapForManager,
    required this.onTapForMember,
  });
  final List<EmployeeEntity> employeeList;
  final void Function(EmployeeEntity employee) onTapForManager;
  final void Function(EmployeeEntity employee) onTapForMember;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text("ID")),
        DataColumn2(label: Text("Name")),
        DataColumn2(label: Text("Email")),
        DataColumn2(label: Text("Profile")),
        DataColumn2(label: Text("Role")),
        DataColumn2(label: Text("CV")),
        DataColumn2(label: Text("Status")),
        DataColumn2(label: Text("Actions")),
      ],
      source: SelectEmployeeRows(
        employeeList: employeeList,
        context: context,
        onTapForManager: onTapForManager,
        onTapForMember: onTapForMember,
      ),
    );
  }
}
