import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/data-tables/custom_data_table.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/features/posts/domain/entities/post_entity.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_dashboard/core/widgets/status-boxes/active_status_container.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/browse_button.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/deactive_button.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/delete_button.dart';

class CustomPostsTable extends StatelessWidget {
  const CustomPostsTable({super.key, required this.activePostsList});
  final List<PostEntity> activePostsList;

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: const [
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.gallery, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Poster"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.status, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Status"),
            ],
          ),
        ),
        DataColumn2(
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Iconsax.message_notif, size: SizesConfig.iconsSm),
              PaddingConfig.w8,
              Text("Replies"),
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
        activePostsList.length,
        (index) => DataRow(
          color: WidgetStateColor.resolveWith(
            (states) => index.isEven ? AppColors.white : AppColors.fieldColor,
          ),
          cells: [
            DataCell(Text(activePostsList[index].body)),
            DataCell(
              Center(
                child: FetchNetworkImage(
                  imagePath: activePostsList[index].poster,
                ),
              ),
            ),
            const DataCell(Center(child: ActiveStatusContainer())),
            DataCell(
              Center(
                child: BrowseButton(
                  onTap: () {
                    context.pushNamed(
                      AppRouteConfig.postReplies,
                      pathParameters: {
                        'id': activePostsList[index].postId.toString(),
                      },
                    );
                  },
                ),
              ),
            ),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DeactivateButton(
                    onTap: () {
                      context.read<PostBloc>().add(
                        UnActivePostEvent(
                          postId: activePostsList[index].postId,
                        ),
                      );
                      context.read<PostBloc>().add(GetActivePostsEvent());
                    },
                  ),
                  PaddingConfig.w8,
                  DeleteButton(
                    onTap: () {
                      context.read<PostBloc>().add(
                        DeletePostEvent(postId: activePostsList[index].postId),
                      );
                      context.read<PostBloc>().add(GetActivePostsEvent());
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
