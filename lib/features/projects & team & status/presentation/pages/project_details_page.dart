import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/device_utility.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/backlog_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/board_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/contract_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/sprints_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/status_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/summary_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/tasks_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/tab-bar-view/team_tab_bar_view.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/tab_bar_item.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0, top: 16.0),
            child: const Breadcrumbs(
              paths: [
                AppRouteConfig.allProjects,
                AppRouteConfig.projectDetails,
              ],
              pages: ["All Project", "Project Details"],
            ),
          ),
          PaddingConfig.h16,
          Row(
            children: [
              const CustomBackButton(),
              PaddingConfig.w8,
              PageTitle(pageTitle: "Project Details"),
            ],
          ),
          PaddingConfig.h24,
          TabBar(
            dividerColor: AppColors.grayShade2,
            labelStyle: AppTextStyle.bodySm(),
            labelColor: AppColors.blueShade2,
            indicatorColor: AppColors.blueShade2,
            isScrollable: !DeviceUtility.isDesktopScreen(context),
            tabs: [
              TabBarItem(itemIcon: Iconsax.global, itemName: "Summary"),
              TabBarItem(itemIcon: Iconsax.note_text, itemName: "Contract"),
              TabBarItem(itemIcon: Iconsax.grid_1, itemName: "Backlog"),
              TabBarItem(itemIcon: Iconsax.grid_6, itemName: "Board"),
              TabBarItem(itemIcon: Iconsax.status, itemName: "Status"),
              TabBarItem(itemIcon: Iconsax.layer, itemName: "Sprints"),
              TabBarItem(itemIcon: Iconsax.hierarchy_2, itemName: "Tasks"),
              TabBarItem(itemIcon: Iconsax.people, itemName: "Team"),
            ],
          ),

          PaddingConfig.h24,
          Expanded(
            child: TabBarView(
              children: [
                SummaryTabBarView(),
                ContractTabBarView(),
                BacklogTabBarView(),
                BoardTabBarView(),
                StatusTabBarView(),
                SprintsTabBarView(),
                TasksTabBarView(),
                TeamTabBarView(
                  team: Team(
                    id: 0,
                    name: 'Mobile Team',
                    members: [
                      Member(
                        id: 0,
                        name: "Hala Kad",
                        email: "email",
                        isManager: true,
                      ),
                      Member(
                        id: 0,
                        name: "Laile",
                        email: "email",
                        isManager: false,
                      ),
                      Member(
                        id: 0,
                        name: "Lilian",
                        email: "email",
                        isManager: false,
                      ),
                      Member(
                        id: 0,
                        name: "Ruha",
                        email: "email",
                        isManager: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
