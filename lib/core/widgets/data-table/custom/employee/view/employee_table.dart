import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/employee/view/employee_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

class EmployeeTable extends StatelessWidget {
  const EmployeeTable({super.key, required this.employeeList});
  final List<EmployeeEntity> employeeList;

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
      source: EmployeeRows(employeeList: employeeList, context: context),
    );
  }
}
