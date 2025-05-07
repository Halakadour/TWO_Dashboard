import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/approved_button.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/seen_button.dart';
import 'package:two_dashboard/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/status-boxes/approved_status_container.dart';
import 'package:two_dashboard/core/widgets/status-boxes/rejected_status_container.dart';
import 'package:two_dashboard/core/widgets/status-boxes/seen_status_container.dart';
import 'package:two_dashboard/core/widgets/status-boxes/un_seen_status_container.dart';
import 'package:two_dashboard/features/contact-us/data/models/contact_us_model.dart';
import 'package:two_dashboard/features/contact-us/presentation/bloc/contact_us_bloc.dart';

class CustomContactUsTable extends StatelessWidget {
  const CustomContactUsTable({super.key, required this.contactUsList});
  final List<ContactUsModel> contactUsList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
        DataColumn2(
          label: Row(
            children: [
              Icon(Iconsax.gallery, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Profile"),
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
              Text("Subject"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.edit, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Description"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.activity, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Status1"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.activity, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Status2"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.chart_3, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Action1"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.chart_3, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Action2"),
            ],
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        contactUsList.length,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(
              Center(
                child: FetchNetworkImage(
                  imagePath: contactUsList[index].client.image,
                ),
              ),
            ),
            DataCell(Center(child: Text(contactUsList[index].client.name))),
            DataCell(Center(child: Text(contactUsList[index].client.email))),
            DataCell(Center(child: Text(contactUsList[index].phone))),
            DataCell(Center(child: Text(contactUsList[index].subject))),
            DataCell(
              Center(
                child: SizedBox(
                  width: 110,
                  child: Text(
                    contactUsList[index].description,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            DataCell(
              Center(
                child:
                    (contactUsList[index].seen == 1)
                        ? const SeenStatusContainer()
                        : const UnSeenStatusContainer(),
              ),
            ),
            DataCell(
              Center(
                child:
                    (contactUsList[index].techApproved == 1)
                        ? const ApprovedStatusContainer()
                        : const RejectedStatusContainer(),
              ),
            ),
            DataCell(
              Center(
                child: SeenButton(
                  onTap: () {
                    context.read<ContactUsBloc>().add(
                      MarkContactUsAsSeenEvent(
                        contactUsId: contactUsList[index].id,
                      ),
                    );
                    context.read<ContactUsBloc>().add(
                      GetContactUsWithSeenAndApprovedEvent(),
                    );
                  },
                ),
              ),
            ),
            DataCell(
              Center(
                child: ApprovedButton(
                  onTap: () {
                    context.read<ContactUsBloc>().add(
                      MarkContactUsAsApprovedEvent(
                        contactUsId: contactUsList[index].id,
                      ),
                    );
                    context.read<ContactUsBloc>().add(
                      GetContactUsWithSeenAndApprovedEvent(),
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
