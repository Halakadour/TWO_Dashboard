import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/save_text_button.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';

class ProjectDialog {
  // Create about Us
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
              title: Text("Sent a message :", style: AppTextStyle.bodyLg()),
              content: SizedBox(
                width: SizesConfig.dialogWidthXl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFormField(
                      labelText: "Message",
                      maxLines: 15,
                      controller: messageController,
                      validator: (p0) {
                        if (p0 == null) {
                          return "Add Text";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                const CancelTextButton(),
                SaveTextButton(
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
          ),
    );
  }
}
