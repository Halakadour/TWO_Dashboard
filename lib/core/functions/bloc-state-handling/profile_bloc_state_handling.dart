import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/device_utility.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/divider/divider_with_text.dart';
import 'package:two_dashboard/core/widgets/images/custom_rounded_image.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_user_table.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/profile/presentation/widgets/custom_user_table.dart';
import 'package:two_dashboard/features/profile/presentation/widgets/user_info_row.dart';

class ProfileBlocStateHandling {
  // Get The User Profile Header
  Widget getUserProfileHeader(
    AuthRoleProfileState state,
    BuildContext context,
  ) {
    if (state.employeeEntityStatus == CasualStatus.loading) {
      return CircularProgressIndicator();
    } else if (state.employeeEntityStatus == CasualStatus.success) {
      return Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // image
              CustomRoundedImage(
                width: 40,
                height: 40,
                padding: 2,
                borderRadius: 30,
                imageType: ImageType.network,
                image: state.employeeEntity!.eImage!,
              ),
            ],
          ),
          PaddingConfig.w8,
          // Name and Email
          if (!DeviceUtility.isMobileScreen(context))
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.employeeEntity!.eName,
                  style: AppTextStyle.subtitle02(
                    color: AppColors.fontDarkColor,
                  ),
                ),
                Text(
                  state.employeeEntity!.eRole,
                  style: AppTextStyle.subtitle03(
                    color: AppColors.fontLightColor,
                  ),
                ),
              ],
            ),
        ],
      );
    } else {
      return SizedBox();
    }
  }

  // For The user Page
  Widget getUserProfilePage(AuthRoleProfileState state) {
    if (state.employeeEntityStatus == CasualStatus.loading) {
      return LoadingStatusAnimation();
    } else if (state.employeeEntityStatus == CasualStatus.success) {
      return Column(
        children: [
          DividerWithText(text: "User Information"),
          SizedBox(height: SizesConfig.spaceBtwSections),
          FetchNetworkImage(imagePath: state.employeeEntity!.eImage!),
          SizedBox(height: SizesConfig.spaceBtwSections),
          UserInfoRow(title: "user name", value: state.employeeEntity!.eName),
          UserInfoRow(title: "user email", value: state.employeeEntity!.eEmail),
          UserInfoRow(title: "user job", value: state.employeeEntity!.eRole),
          UserInfoRow(title: "user cv", value: "cv.pdf"),
        ],
      );
    } else if (state.employeeEntityStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return Center(child: UnauthorizedStatusAnimation());
    }
  }

  // For The users Informations
  Widget getUsersTable(AuthRoleProfileState state) {
    if (state.userListStatus == CasualStatus.loading) {
      return const LoadingUserTable();
    } else if (state.userListStatus == CasualStatus.success) {
      return CustomUserTable(employeeList: state.userList);
    } else if (state.userListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // For Approving Users
  void toggleApproveUser(AuthRoleProfileState state, BuildContext context) {
    if (state.toggleApproveStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.toggleApproveStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.toggleApproveStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.toggleApproveStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }
}
