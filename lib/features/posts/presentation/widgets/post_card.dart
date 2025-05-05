import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/status-boxes/active_status_container.dart';
import 'package:two_dashboard/features/posts/domain/entities/post_entity.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.postEntity});
  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    final GlobalKey iconKey = GlobalKey();

    return Container(
      key: iconKey,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: AppColors.gray,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  final RenderBox renderBox =
                      iconKey.currentContext!.findRenderObject() as RenderBox;
                  final Offset offset = renderBox.localToGlobal(Offset.zero);
                  final Size size = renderBox.size;
                  showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                      offset.dx,
                      offset.dy - 40,
                      offset.dx + size.width,
                      0,
                    ),
                    items: [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.eye_slash,
                              color: AppColors.yellowShade2,
                            ),
                            PaddingConfig.w8,
                            Text(
                              "Un Active",
                              style: AppTextStyle.subtitle03(
                                color: AppColors.yellowShade2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(Iconsax.trash, color: AppColors.redShade2),
                            PaddingConfig.w8,
                            Text(
                              "Delete",
                              style: AppTextStyle.subtitle03(
                                color: AppColors.redShade2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(Iconsax.message, color: AppColors.blueShade2),
                            PaddingConfig.w8,
                            Text(
                              "Replies",
                              style: AppTextStyle.subtitle03(
                                color: AppColors.blueShade2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).then((value) {
                    if (value == 0) {
                      context.read<PostBloc>().add(
                        UnActivePostEvent(postId: postEntity.postId),
                      );
                    } else if (value == 1) {
                      context.read<PostBloc>().add(
                        DeletePostEvent(postId: postEntity.postId),
                      );
                    } else if (value == 2) {
                      context.pushNamed(
                        AppRouteConfig.postReplies,
                        pathParameters: {'id': postEntity.postId.toString()},
                      );
                    }
                  });
                },
                child: const Icon(Iconsax.more),
              ),
            ],
          ),
          FetchNetworkImage(
            imagePath: postEntity.poster,
            height: 180,
            width: double.maxFinite,
          ),
          const ActiveStatusContainer(),
          PaddingConfig.h8,
          Text(
            postEntity.body,
            style: AppTextStyle.subtitle01(),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
