import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/update_elevated_button.dart';
import 'package:two_dashboard/core/widgets/images/image_circle.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';

class TeamTabBarView extends StatelessWidget {
  const TeamTabBarView({super.key, required this.team});
  final Team team;

  @override
  Widget build(BuildContext context) {
    final teamMgr = team.members.firstWhere(
      (element) => element.isManager == true,
    );
    final membersList =
        team.members.where((element) => element.isManager == false).toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UpdateElevatedButton(updateType: "Team", onPressed: () {}),
              PaddingConfig.w8,
              CreateElevatedButton(addingType: "New Team", onPressed: () {}),
            ],
          ),
          PaddingConfig.h32,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Team Name", style: AppTextStyle.bodyMd()),
                        PaddingConfig.w48,
                        Text(
                          team.name,
                          style: AppTextStyle.bodySm(
                            color: AppColors.fontLightGray,
                          ),
                        ),
                      ],
                    ),
                    PaddingConfig.h32,
                    Row(
                      children: [
                        Text("Team Manager", style: AppTextStyle.bodyMd()),
                        PaddingConfig.w32,
                        Row(
                          children: [
                            ImageCircle(),
                            PaddingConfig.w8,
                            Text(
                              teamMgr.name,
                              style: AppTextStyle.bodySm(
                                color: AppColors.fontLightGray,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    PaddingConfig.h16,
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Team Members"),
                    PaddingConfig.w32,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: ListView.builder(
                            itemCount: membersList.length,
                            itemBuilder:
                                (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      ImageCircle(),
                                      PaddingConfig.w8,
                                      Text(
                                        membersList[index].name,
                                        style: AppTextStyle.bodySm(
                                          color: AppColors.fontLightGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ),
                        ),
                      ],
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
