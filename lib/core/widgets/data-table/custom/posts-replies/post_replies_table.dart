import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/posts-replies/post_replies_table_source.dart';
import 'package:two_dashboard/core/widgets/data-table/custom_paginated_data_table.dart';
import 'package:two_dashboard/features/posts/domain/entities/reply_entity.dart';

class PostRepliesTable extends StatelessWidget {
  const PostRepliesTable({super.key, required this.repliesList});
  final List<ReplyEntity> repliesList;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn2(label: Text(TextStrings.name)),
        DataColumn2(label: Text(TextStrings.email)),
        DataColumn2(label: Text(TextStrings.phone)),
        DataColumn2(label: Text(TextStrings.cv)),
        DataColumn2(label: Text(TextStrings.actions)),
      ],
      source: PostRepliesRows(repliesList: repliesList, context: context),
    );
  }
}
