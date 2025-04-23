import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_post_replies_table.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_posts_table.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';
import 'package:two_dashboard/features/posts/presentation/widgets/custom_post_replies_table.dart';
import 'package:two_dashboard/features/posts/presentation/widgets/custom_posts_table.dart';

class PostsBlocStateHandling {
  // Get Post Table
  Widget getPostsTable(PostState state, bool actriveSelected) {
    if (state.activePostsListStatus == CasualStatus.loading ||
        state.unActivePostsListStatus == CasualStatus.loading) {
      return const LoadingPostsTable();
    } else if (state.activePostsListStatus == CasualStatus.success ||
        state.unActivePostsListStatus == CasualStatus.success) {
      return CustomPostsTable(
        activePostsList:
            actriveSelected ? state.activePostsList : state.unActivePostsList,
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
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deletePostStatus == CasualStatus.success ||
        state.unActivePostStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.deletePostStatus == CasualStatus.failure ||
        state.unActivePostStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deletePostStatus == CasualStatus.noToken ||
        state.unActivePostStatus == CasualStatus.noToken) {
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
    } else if (state.postsRepliesListStatus == CasualStatus.noToken) {
      return UnauthorizedStatusAnimation();
    } else {
      return const SizedBox();
    }
  }
}
