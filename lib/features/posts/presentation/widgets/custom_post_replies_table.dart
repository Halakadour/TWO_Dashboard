import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/accept_button.dart';
import 'package:two_dashboard/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_dashboard/features/posts/domain/entities/reply_entity.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomPostRepliesTable extends StatelessWidget {
  const CustomPostRepliesTable({super.key, required this.repliesList});
  final List<ReplyEntity> repliesList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
          label: Row(
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
              Icon(Iconsax.call, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Phone"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.document, size: SizesConfig.iconsSm),
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
              Text("Actions"),
            ],
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        repliesList.length,
        (index) => DataRow(
          cells: [
            DataCell(Text(repliesList[index].fullName)),
            DataCell(Center(child: Text(repliesList[index].email))),
            DataCell(Center(child: Text(repliesList[index].phone))),
            DataCell(
              Center(
                child: InkWell(
                  onTap:
                      () => launchUrl(
                        Uri.parse('$imageUri/${repliesList[index].cvFile}'),
                      ),
                  child: Text(
                    repliesList[index].cvFile,
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
                child: AcceptButton(
                  onTap: () {
                    context.read<PostBloc>().add(
                      AcceptReplyEvent(replyId: repliesList[index].id),
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
