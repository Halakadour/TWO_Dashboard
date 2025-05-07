import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_post_replies_table.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_dashboard/features/posts/presentation/widgets/custom_post_replies_table.dart';
import 'package:two_dashboard/features/posts/presentation/widgets/post_card.dart';

class PostsBlocStateHandling {
  // Get Post Table
  Widget getPostsTable(PostState state, bool actriveSelected) {
    if (state.activePostsListStatus == CasualStatus.loading ||
        state.unActivePostsListStatus == CasualStatus.loading) {
      return Center(child: const LoadingStatusAnimation());
    } else if (state.activePostsListStatus == CasualStatus.success ||
        state.unActivePostsListStatus == CasualStatus.success) {
      return Expanded(
        child: GridView.builder(
          itemCount: state.activePostsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder:
              (context, index) =>
                  PostCard(postEntity: state.activePostsList[index]),
        ),
      );
    } else if (state.activePostsListStatus == CasualStatus.failure ||
        state.unActivePostsListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // Delete And Unactive
  void deleteAndUnactivePOst(PostState state, BuildContext context) {
    if (state.deletePostStatus == CasualStatus.loading ||
        state.unActivePostStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.deletePostStatus == CasualStatus.success ||
        state.unActivePostStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.deletePostStatus == CasualStatus.failure ||
        state.unActivePostStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deletePostStatus == CasualStatus.notAuthorized ||
        state.unActivePostStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }

  // Get posts replies table
  Widget getPostReplies(PostState state) {
    if (state.postsRepliesListStatus == CasualStatus.loading) {
      return const LoadingPostRepliesTable();
    } else if (state.postsRepliesListStatus == CasualStatus.success) {
      return CustomPostRepliesTable(repliesList: state.postRepliesList);
    } else if (state.postsRepliesListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else if (state.postsRepliesListStatus == CasualStatus.notAuthorized) {
      return UnauthorizedStatusAnimation();
    } else {
      return const SizedBox();
    }
  }

  // Create Post
  void createPost(PostState state, BuildContext context) {
    if (state.createPostStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createPostStatus == CasualStatus.success) {
      context.pop();
      context.read<PostBloc>().add(GetActivePostsEvent());
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.post);
        context.pop();
      });
    } else if (state.createPostStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createPostStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}
