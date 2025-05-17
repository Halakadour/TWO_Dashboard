import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/theme/text_style.dart' show AppTextStyle;
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/empty_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/features/projects%20&%20Team/presentation/bloc/project_and_task_bloc.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/constants/sizes_config.dart';
import '../../../../config/routes/app_route_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../core/widgets/breadcrumbs/breadcumbs_item.dart';
import '../../../../core/widgets/buttons/icon-buttons/back_button.dart';
import '../../../../core/widgets/container/custom_rounder_container.dart';
import '../../../../core/widgets/texts/page_title.dart';
import '../../domain/entity/team_entity.dart';

class SelectTeamPage extends StatefulWidget {
  const SelectTeamPage({super.key});

  @override
  State<SelectTeamPage> createState() => _SelectTeamPageState();
}

class _SelectTeamPageState extends State<SelectTeamPage> {
  TeamEntity? selectedTeam;

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 1;
    double width = MediaQuery.of(context).size.width;

    if (width >= SizesConfig.desktopScreenSize) {
      crossAxisCount = 4;
    } else if (width >= SizesConfig.tabletScreenSize) {
      crossAxisCount = 3;
    }

    return PageTemplate(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Breadcrumbs(
              paths: [
                AppRouteConfig.projects,
                AppRouteConfig.createProject,
                AppRouteConfig.selectTeam,
              ],
              pages: ["Project", "Create Projcet", "Select Team"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                const CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Select Team"),
              ],
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateElevatedButton(addingType: "New Team", onPressed: () {}),
              ],
            ),
            PaddingConfig.h24,
            BlocBuilder<ProjectAndTaskBloc, ProjectAndTaskState>(
              buildWhen:
                  (previous, current) =>
                      previous.showTeamsStatus != current.showTeamsStatus,
              builder: (context, state) {
                if (state.showTeamsStatus == CasualStatus.loading) {
                  return Center(child: LoadingStatusAnimation());
                } else if (state.showTeamsStatus == CasualStatus.success) {
                  if (state.showTeams.isEmpty) {
                    return Center(child: EmptyStatusAnimation());
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.2,
                      ),
                      itemCount: state.showTeams.length,
                      itemBuilder: (context, index) {
                        final team = state.showTeams[index];
                        final isSelected = selectedTeam?.id == team.id;
                        return GestureDetector(
                          onTap: () {
                            setState(() => selectedTeam = team);
                          },
                          child: CustomRounderContainer(
                            borderColor:
                                isSelected
                                    ? AppColors.greenShade2
                                    : AppColors.grayShade2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(team.name, style: AppTextStyle.bodyMd()),
                                const SizedBox(height: 24),
                                Wrap(
                                  spacing: 12,
                                  runSpacing: 16,
                                  children:
                                      team.membersList.map((member) {
                                        return SizedBox(
                                          width: 70,
                                          child: Column(
                                            children: [
                                              FetchNetworkImage(
                                                imagePath: member.eImage,
                                              ),
                                              PaddingConfig.h8,
                                              Text(
                                                member.eName,
                                                style: AppTextStyle.bodySm(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                              Text(
                                                member.eRole,
                                                style: AppTextStyle.bodyXs(
                                                  color:
                                                      AppColors.fontLightGray,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else if (state.showTeamsStatus == CasualStatus.failure) {
                  return ErrorStatusAnimation(errorMessage: state.message);
                } else {
                  return SizedBox();
                }
              },
            ),
            SaveElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedTeam);
              },
            ),
          ],
        ),
      ),
    );
  }
}
