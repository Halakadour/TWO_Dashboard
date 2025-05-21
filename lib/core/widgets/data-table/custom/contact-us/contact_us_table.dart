import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/contact-us/contact_us_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/contact-us/data/models/contact_us_model.dart';

class ContactUsTable extends StatelessWidget {
  const ContactUsTable({super.key, required this.contactUsList});
  final List<ContactUsModel?> contactUsList;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text("Profile")),
        DataColumn2(label: Text("Name")),
        DataColumn2(label: Text("Email")),
        DataColumn2(label: Text("Phone")),
        DataColumn2(label: Text("Subject")),
        DataColumn2(label: Text("Seen")),
        DataColumn2(label: Text("Approved")),
        DataColumn2(label: Text("Actions")),
      ],
      source: ContactUsRows(contactUsList: contactUsList, context: context),
    );
  }
}
