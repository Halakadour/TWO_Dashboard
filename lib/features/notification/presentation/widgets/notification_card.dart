import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/field_status_container.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/notification/data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationModel});
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.grayshade1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: AppColors.blueShade2.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ".P",
                    style: AppTextStyle.headerMd(color: AppColors.blueShade2),
                  ),
                ),
                PaddingConfig.w16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Project Update",
                              style: AppTextStyle.bodyLg(),
                            ),
                          ],
                        ),
                        PaddingConfig.w32,
                        Text(
                          HelperFunctions.getTimeAgo(
                            notificationModel.project.updatedAt,
                          ),
                          style: AppTextStyle.bodySm(
                            color: AppColors.fontLightGray,
                          ),
                        ),
                      ],
                    ),
                    PaddingConfig.h8,
                    Row(
                      children: [
                        Text(
                          "Project Updated to :",
                          style: AppTextStyle.bodySm(),
                        ),
                        PaddingConfig.w32,
                        FieldStatusContainer(
                          fieldStatus:
                              notificationModel.projectStatusUpdatedTo
                                      .toLowerCase()
                                      .contains('rej')
                                  ? FieldStatus.unApproved
                                  : FieldStatus.approved,
                        ),
                      ],
                    ),
                    PaddingConfig.h8,
                    if (notificationModel.message.trim().isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Message : ",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.fontDarkGray,
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              notificationModel.message,
                              overflow: TextOverflow.fade,
                              style: AppTextStyle.bodySm(),
                            ),
                          ),
                        ],
                      ),
                    PaddingConfig.h8,
                  ],
                ),
              ],
            ),
            PaddingConfig.h16,
            Divider(color: AppColors.grayShade2, thickness: 0.7),
            BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
              listenWhen:
                  (previous, current) =>
                      previous.markNotificationAsReadStatus !=
                      current.markNotificationAsReadStatus,
              listener: (context, state) {
                if (state.markNotificationAsReadStatus ==
                    CasualStatus.success) {
                  context.read<AuthRoleProfileBloc>().add(
                    ShowUnReadNotificationListEvent(),
                  );
                }
              },
              child: GestureDetector(
                onTap:
                    () => context.read<AuthRoleProfileBloc>().add(
                      MarkNotificationAsReadEvent(id: notificationModel.id),
                    ),
                child: Row(
                  children: [
                    PaddingConfig.w8,
                    Icon(Iconsax.eye),
                    PaddingConfig.w8,
                    Text("Mark as read", style: AppTextStyle.bodySm()),
                  ],
                ),
              ),
            ),
            PaddingConfig.h8,
          ],
        ),
      ),
    );
  }
}
