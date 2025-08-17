import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/dialog/project/sent_reject_project_message_dialog.dart';
import 'package:two_dashboard/core/widgets/menus/custom_side_menu_item.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_status_team_bloc.dart';

void showPendedProjectActionSideMenu(
  GlobalKey<State<StatefulWidget>> iconKey,
  BuildContext context,
  ProjectEntity project,
) async {
  final RenderBox renderBox =
      iconKey.currentContext!.findRenderObject() as RenderBox;
  final Offset offset = renderBox.localToGlobal(Offset.zero);
  final Size size = renderBox.size;
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy - 37,
      offset.dx + size.width,
      0,
    ),
    items: [
      PopupMenuItem<int>(
        value: 0,
        child: CustomSideMenuItem(
          icon: Iconsax.like_1,
          color: AppColors.greenShade2,
          action: "Approve",
        ),
      ),
      PopupMenuItem<int>(
        value: 1,
        child: CustomSideMenuItem(
          icon: Iconsax.dislike,
          color: AppColors.redShade2,
          action: "Reject",
        ),
      ),
    ],
  ).then((value) {
    if (value == 0) {
      context.read<ProjectStatusTeamBloc>().add(
        ApproveProjectsEvent(projectId: project.id),
      );
      context.read<ProjectStatusTeamBloc>().add(ShowPendedProjectsEvent());
    } else if (value == 1) {
      sentRejectProjectMessageDialog(context, project.id);
    }
  });
}
