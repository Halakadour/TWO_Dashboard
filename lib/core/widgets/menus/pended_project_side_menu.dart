import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/dialog/project/sent_edit_project_message_dialod.dart';
import 'package:two_dashboard/core/widgets/menus/custom_side_menu_item.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_and_team_bloc.dart';

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
      PopupMenuItem<int>(
        value: 2,
        child: CustomSideMenuItem(
          icon: Iconsax.message,
          color: AppColors.blueShade2,
          action: "Sent Message",
        ),
      ),
    ],
  ).then((value) {
    if (value == 0) {
      context.read<ProjectAndTeamBloc>().add(
        ApproveProjectsEvent(projectId: project.id),
      );
    } else if (value == 1) {
      context.read<ProjectAndTeamBloc>().add(
        RejectProjectsEvent(projectId: project.id),
      );
    } else if (value == 2) {
      sentEditProjectMessageDialog(
        context,
        TextEditingController(
          // "Hello ${project.fullName}, We have reviewed your request regarding ${project.pType.name}.\nWe are pleased to share the following preliminary ${project.cType.name} with you:\nExpected project time: ${project.duration}\nExpected cost: ${project.cost}\nWe would like to invite you to an initial meeting to discuss the analysis in detail.",
          // "Hello ${project.fullName}, Thank you for contacting us and your interest in TWO's services. We have reviewed your request regarding ${project.pType.name}.\nWe are pleased to share the following preliminary ${project.cType.name} with you:\nExpected project time: 6 months\nExpected cost: 10 million SYP\nScope of work\nPoint 1:\nPoint 2: \nPoint 3:\nExpected deliverables: A fully functional application, technical documentation, and a final test report.\nWe would like to invite you to an initial meeting to discuss the analysis in detail, answer your questions, and explore the possibility of collaboration.",
        ),
        project.id,
      );
    }
  });
}
