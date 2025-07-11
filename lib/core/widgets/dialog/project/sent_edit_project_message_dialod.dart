import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/project_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/save_text_button.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_and_team_bloc.dart';

Future<dynamic> sentEditProjectMessageDialog(
  BuildContext context,
  TextEditingController messageController,
  int projectId,
) {
  return showDialog(
    context: context,
    builder:
        (context) => SizedBox(
          height: 100,
          child: AlertDialog(
            title: Text(TextStrings.sentMessage, style: AppTextStyle.bodyLg()),
            content: SizedBox(
              width: SizesConfig.dialogWidthXl,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(
                    labelText: TextStrings.message,
                    maxLines: 15,
                    controller: messageController,
                    validator: (p0) {
                      if (p0 == null) {
                        return TextStrings.fieldValidation;
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            actions: [
              const CancelTextButton(),
              BlocListener<ProjectAndTeamBloc, ProjectAndTeamState>(
                listenWhen:
                    (previous, current) =>
                        previous.editRequestProjectStatus !=
                        current.editRequestProjectStatus,
                listener: (context, state) {
                  ProjectBlocStateHandling().sentEditProjectMessage(
                    state,
                    context,
                  );
                },
                child: SaveTextButton(
                  onPressed: () {
                    context.read<ProjectAndTeamBloc>().add(
                      SentEditProjectMessageEvent(
                        projectId: projectId,
                        message: messageController.text,
                      ),
                    );
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
  );
}
