import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';

class PostsDialogs {
  void filterPosts(BuildContext context, ValueNotifier<bool> actriveSelected) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Filter By :", style: AppTextStyle.subtitle01()),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activation :",
                    style: AppTextStyle.subtitle03(
                      color: AppColors.greenShade2,
                    ),
                  ),
                  PaddingConfig.h24,
                  ValueListenableBuilder(
                    valueListenable: actriveSelected,
                    builder:
                        (context, value, child) => Row(
                          children: [
                            InkWell(
                              onTap: () {
                                actriveSelected.value = true;
                                context.read<PostBloc>().add(
                                  GetActivePostsEvent(),
                                );
                                context.pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      value
                                          ? AppColors.greenShade2
                                          : AppColors.gray,
                                ),
                                child: Text(
                                  "Active posts",
                                  style: AppTextStyle.subtitle04(
                                    color:
                                        value
                                            ? AppColors.white
                                            : AppColors.fontDarkColor,
                                  ),
                                ),
                              ),
                            ),
                            PaddingConfig.w16,
                            InkWell(
                              onTap: () {
                                actriveSelected.value = false;
                                context.read<PostBloc>().add(
                                  GetUnActivePostsEvent(),
                                );
                                context.pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      !value
                                          ? AppColors.greenShade2
                                          : AppColors.gray,
                                ),
                                child: Text(
                                  "Un Active posts",
                                  style: AppTextStyle.subtitle04(
                                    color:
                                        !value
                                            ? AppColors.white
                                            : AppColors.fontDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  ),
                ],
              ),
            ],
          ),
    );
  }

  Future<dynamic> postRepliesFilter(
    BuildContext context,
    ValueNotifier<bool> actriveSelected,
    String postId,
  ) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Filter By :", style: AppTextStyle.subtitle01()),
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Acceptation :",
                    style: AppTextStyle.subtitle03(
                      color: AppColors.greenShade2,
                    ),
                  ),
                  PaddingConfig.h24,
                  ValueListenableBuilder(
                    valueListenable: actriveSelected,
                    builder:
                        (context, value, child) => Row(
                          children: [
                            InkWell(
                              onTap: () {
                                actriveSelected.value = true;
                                context.read<PostBloc>().add(
                                  GetPostsRepliesEvent(
                                    postId: int.parse(postId),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      value
                                          ? AppColors.greenShade2
                                          : AppColors.gray,
                                ),
                                child: Text(
                                  "Un Accepted replies",
                                  style: AppTextStyle.subtitle04(
                                    color:
                                        value
                                            ? AppColors.white
                                            : AppColors.fontDarkColor,
                                  ),
                                ),
                              ),
                            ),
                            PaddingConfig.w16,
                            InkWell(
                              onTap: () {
                                actriveSelected.value = false;
                                context.read<PostBloc>().add(
                                  GetPostsAcceptedRepliesEvent(
                                    postId: int.parse(postId),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 9,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      !value
                                          ? AppColors.greenShade2
                                          : AppColors.gray,
                                ),
                                child: Text(
                                  "Accepted replies",
                                  style: AppTextStyle.subtitle04(
                                    color:
                                        !value
                                            ? AppColors.white
                                            : AppColors.fontDarkColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
