import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/auth_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/dialog/auth/logout_dialog.dart';
import 'package:two_dashboard/core/widgets/layouts/sidebar/logout_widget.dart';
import 'package:two_dashboard/core/widgets/layouts/sidebar/menu_item.dart';
import 'package:two_dashboard/core/widgets/layouts/sidebar/visibilty_button.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class CustomSidebar extends StatefulWidget {
  const CustomSidebar({
    super.key,
    required this.currentPageIndex,
    required this.onItemSelected,
  });

  final int currentPageIndex;
  final Function(int) onItemSelected;

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  bool main = true;
  bool campony = true;
  bool other = true;
  bool contracts = false;
  bool project = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.navy,
          border: Border(right: BorderSide(color: AppColors.gray, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: SizesConfig.md),
                child: SvgPicture.asset(IconsPath.logo),
              ),
              PaddingConfig.h16,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizesConfig.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      TextStrings.main.toUpperCase(),
                      style: AppTextStyle.bodySm(
                        color: AppColors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    PaddingConfig.h8,
                    MenuItem(
                      icon: IconsPath.category,
                      itemName: TextStrings.dashboard,
                      pageNum: 0,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: MenuItem(
                            icon: IconsPath.paper,
                            itemName: TextStrings.porojects,
                            pageNum: 1,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                        ),
                        VisibilityButton(
                          isdown: project,
                          onPressed: () {
                            setState(() {
                              project = !project;
                            });
                          },
                        ),
                      ],
                    ),
                    Visibility(
                      visible: project,
                      child: Row(
                        children: [
                          PaddingConfig.w24,
                          Expanded(
                            child: MenuItem(
                              icon: IconsPath.bookMarker,
                              itemName: TextStrings.myProjects,
                              pageNum: 2,
                              currentPage: widget.currentPageIndex,
                              onTap: widget.onItemSelected,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: project,
                      child: Row(
                        children: [
                          PaddingConfig.w24,
                          Expanded(
                            child: MenuItem(
                              icon: IconsPath.bookMarker,
                              itemName: TextStrings.pendedProjects,
                              pageNum: 3,
                              currentPage: widget.currentPageIndex,
                              onTap: widget.onItemSelected,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MenuItem(
                      icon: IconsPath.task,
                      itemName: TextStrings.sprintTasks,
                      pageNum: 4,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    // MenuItem(
                    //   icon: IconsPath.calender,
                    //   itemName: "Calender",
                    //   pageNum: 4,
                    //   currentPage: widget.currentPageIndex,
                    //   onTap: widget.onItemSelected,
                    // ),
                    PaddingConfig.h8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextStrings.company.toUpperCase(),
                          style: AppTextStyle.bodySm(
                            color: AppColors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        VisibilityButton(
                          isdown: campony,
                          onPressed: () {
                            setState(() {
                              campony = !campony;
                            });
                          },
                        ),
                      ],
                    ),
                    PaddingConfig.h8,
                    Visibility(
                      visible: campony,
                      child: Column(
                        children: [
                          MenuItem(
                            icon: IconsPath.threeUsers,
                            itemName: TextStrings.members,
                            pageNum: 5,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MenuItem(
                                  icon: IconsPath.paper,
                                  itemName: TextStrings.contracts,
                                  pageNum: 6,
                                  currentPage: widget.currentPageIndex,
                                  onTap: widget.onItemSelected,
                                ),
                              ),
                              VisibilityButton(
                                isdown: contracts,
                                onPressed: () {
                                  setState(() {
                                    contracts = !contracts;
                                  });
                                },
                              ),
                            ],
                          ),
                          Visibility(
                            visible: contracts,
                            child: Row(
                              children: [
                                PaddingConfig.w24,
                                Expanded(
                                  child: MenuItem(
                                    icon: IconsPath.bookMarker,
                                    itemName: TextStrings.drafts,
                                    pageNum: 7,
                                    currentPage: widget.currentPageIndex,
                                    onTap: widget.onItemSelected,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MenuItem(
                            icon: IconsPath.editSquare,
                            itemName: TextStrings.aboutUsWhyUs,
                            pageNum: 8,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          MenuItem(
                            icon: IconsPath.bag,
                            itemName: TextStrings.services,
                            pageNum: 9,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          MenuItem(
                            icon: IconsPath.send,
                            itemName: TextStrings.posts,
                            pageNum: 10,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                        ],
                      ),
                    ),
                    PaddingConfig.h8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextStrings.other.toUpperCase(),
                          style: AppTextStyle.bodySm(
                            color: AppColors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        VisibilityButton(
                          isdown: other,
                          onPressed: () {
                            setState(() {
                              other = !other;
                            });
                          },
                        ),
                      ],
                    ),
                    PaddingConfig.h8,
                    Visibility(
                      visible: other,
                      child: Column(
                        children: [
                          MenuItem(
                            icon: IconsPath.setting,
                            itemName: TextStrings.setting,
                            pageNum: 11,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          BlocListener<
                            AuthRoleProfileBloc,
                            AuthRoleProfileState
                          >(
                            listener: (context, state) {
                              AuthBlocStateHandling().logoutStateHandling(
                                state,
                                context,
                              );
                            },
                            listenWhen:
                                (previous, current) =>
                                    previous.logoutStatusStatus !=
                                    current.logoutStatusStatus,
                            child: GestureDetector(
                              onTap: () => showLogoutDialog(context),
                              child: const LogoutWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
