import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/services/shared_preferences_services.dart';
import 'package:two_dashboard/core/widgets/dialog/auth/auth_dialogs.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/core/widgets/layouts/sidebar/menu_item.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
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
                      "MAIN",
                      style: AppTextStyle.subtitle03(
                        color: AppColors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    PaddingConfig.h8,
                    MenuItem(
                      icon: IconsPath.category,
                      itemName: "Dashboard",
                      pageNum: 0,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.task,
                      itemName: "Tasks",
                      pageNum: 1,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.paper,
                      itemName: "Projecs",
                      pageNum: 2,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.calender,
                      itemName: "Calender",
                      pageNum: 3,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    MenuItem(
                      icon: IconsPath.chat,
                      itemName: "Inbox",
                      pageNum: 4,
                      currentPage: widget.currentPageIndex,
                      onTap: widget.onItemSelected,
                    ),
                    PaddingConfig.h8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "COMPANY",
                          style: AppTextStyle.subtitle03(
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
                            itemName: "Members",
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
                                  itemName: "Contracts",
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
                                    itemName: "Drafts",
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
                            itemName: "About Us & Why Us",
                            pageNum: 8,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          MenuItem(
                            icon: IconsPath.bag,
                            itemName: "Services",
                            pageNum: 9,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          MenuItem(
                            icon: IconsPath.send,
                            itemName: "Posts",
                            pageNum: 10,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          MenuItem(
                            icon: IconsPath.email,
                            itemName: "Contact Us",
                            pageNum: 11,
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
                          "OTHER",
                          style: AppTextStyle.subtitle03(
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
                            itemName: "Settings",
                            pageNum: 12,
                            currentPage: widget.currentPageIndex,
                            onTap: widget.onItemSelected,
                          ),
                          BlocListener<
                            AuthRoleProfileBloc,
                            AuthRoleProfileState
                          >(
                            listener: (context, state) {
                              logoutStateHandling(state, context);
                            },
                            listenWhen:
                                (previous, current) =>
                                    previous.logoutStatusStatus !=
                                    current.logoutStatusStatus,
                            child: GestureDetector(
                              onTap: () => AuthDialogs().logoutDialog(context),
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

  void logoutStateHandling(
    AuthRoleProfileState state,
    BuildContext context,
  ) async {
    if (state.logoutStatusStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.logoutStatusStatus == CasualStatus.success) {
      context.pop();
      await SharedPreferencesServices.deleteUserToken();
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.login);
        context.pop();
      });
    } else if (state.authModelStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.authModelStatus == CasualStatus.notAuthorized) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}

// ignore: must_be_immutable
class VisibilityButton extends StatelessWidget {
  VisibilityButton({super.key, required this.onPressed, required this.isdown});
  final void Function()? onPressed;
  bool isdown;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        !isdown ? Iconsax.arrow_down_1 : Iconsax.arrow_up_2,
        color: AppColors.white,
        size: SizesConfig.iconsSm,
      ),
    );
  }
}

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizesConfig.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SvgPicture.asset(
              IconsPath.logout,
              // ignore: deprecated_member_use
              color: AppColors.white,
            ),
          ),
          Text(
            "Logout",
            style: AppTextStyle.buttonStyle(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
