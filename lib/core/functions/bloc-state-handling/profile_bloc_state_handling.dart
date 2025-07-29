import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/device_utility.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/update_elevated_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/field_status_container.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/employee/select/select_employee_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/employee/view/employee_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/employee/view/loading_employee_table.dart';
import 'package:two_dashboard/core/widgets/dialog/status/error_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/not_authorized_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/core/widgets/dropdown-list/custom_dropdown_list_for_client_entity.dart';
import 'package:two_dashboard/core/widgets/images/fetch_network_image.dart';
import 'package:two_dashboard/core/widgets/texts/linked_text.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/profile/domain/entities/client_entity.dart';
import 'package:two_dashboard/features/profile/domain/entities/employee_entity.dart';

import '../../widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';

class ProfileBlocStateHandling {
  // Get The User Profile Header
  Widget getUserProfileHeader(
    AuthRoleProfileState state,
    BuildContext context,
  ) {
    if (state.userHeaderStatus == CasualStatus.loading) {
      return LoadingUserHeaderInfo();
    } else if (state.userHeaderStatus == CasualStatus.success) {
      return UserHeaderInfo(employeeEntity: state.userHeader!);
    } else {
      return SizedBox();
    }
  }

  // For The user Page
  Widget getUserProfilePage(AuthRoleProfileState state) {
    if (state.userProfileStatus == CasualStatus.loading) {
      return Center(child: LoadingStatusAnimation());
    } else if (state.userProfileStatus == CasualStatus.success) {
      final user = state.userProfile!;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  FetchNetworkImage(
                    height: 175,
                    width: 175,
                    shape: BoxShape.circle,
                    imagePath: user.image,
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.blueShade2,
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      // _getImageFile();
                    },
                    icon: const Icon(Iconsax.camera, color: AppColors.white),
                  ),
                ],
              ),
              PaddingConfig.h16,
              // Name
              Text(user.name, style: AppTextStyle.bodyLg()),
              // Email
              Text(
                user.email,
                style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
              ),
              PaddingConfig.h16,
              // Roles
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Iconsax.bag_2, size: SizesConfig.iconsSm),
                  PaddingConfig.w8,
                  Text("Role", style: AppTextStyle.bodySm()),
                ],
              ),
              PaddingConfig.h8,
              CustomRounderContainer(
                child: Text(
                  user.role,
                  style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
                ),
              ),
              PaddingConfig.h16,
              // State
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Iconsax.status, size: SizesConfig.iconsSm),
                  PaddingConfig.w8,
                  Text("Status", style: AppTextStyle.bodySm()),
                ],
              ),
              PaddingConfig.h8,
              user.approved == 1
                  ? FieldStatusContainer(fieldStatus: FieldStatus.approved)
                  : FieldStatusContainer(fieldStatus: FieldStatus.unApproved),
              PaddingConfig.h16,
              // CV
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Iconsax.document_1, size: SizesConfig.iconsSm),
                  PaddingConfig.w8,
                  Text("CV", style: AppTextStyle.bodySm()),
                ],
              ),
              PaddingConfig.h8,
              CustomRounderContainer(
                child: Row(
                  children: [
                    LinkedText(link: user.cv),
                    PaddingConfig.w16,
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.blueShade2,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Iconsax.edit,
                        color: AppColors.white,
                        size: SizesConfig.iconsSm,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PaddingConfig.h96,
              // Edit Button
              UpdateElevatedButton(updateType: "Profile", onPressed: () {}),
            ],
          ),
        ],
      );
    } else if (state.userProfileStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return Center(child: UnauthorizedStatusAnimation());
    }
  }

  // For The users Informations
  Widget getUsersTable(AuthRoleProfileState state) {
    if (state.userListStatus == CasualStatus.loading) {
      return const LoadingEmployeeTable();
    } else if (state.userListStatus == CasualStatus.success) {
      return EmployeeTable(employeeList: state.userList);
    } else if (state.userListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // For User Selection
  Widget getSelectUsersTable(
    AuthRoleProfileState state,
    final void Function(EmployeeEntity employee) onTapForManager,
    final void Function(EmployeeEntity employee) onTapForMember,
  ) {
    if (state.userListStatus == CasualStatus.loading) {
      return const LoadingEmployeeTable();
    } else if (state.userListStatus == CasualStatus.success) {
      return SelectEmployeeTable(
        employeeList: state.userList,
        onTapForManager: onTapForManager,
        onTapForMember: onTapForMember,
      );
    } else if (state.userListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // Get Clients
  Widget getClientsDropList(
    AuthRoleProfileState state,
    ClientEntity? clientEntity,
    void Function(ClientEntity?)? onChanged,
  ) {
    if (state.clientListStatus == CasualStatus.success) {
      return CustomDropdownListForClientEntity(
        selectYour: "client",
        value: clientEntity,
        items:
            state.clientList.map((client) {
              return DropdownMenuItem(
                value: client,
                child: Row(
                  children: [
                    FetchNetworkImage(
                      width: 40,
                      height: 40,
                      imagePath: client.cImage,
                    ),
                    PaddingConfig.w8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(client.cName, style: AppTextStyle.bodySm()),
                        Text(client.cEmail, style: AppTextStyle.bodyXs()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
        onChanged: onChanged,
      );
    } else if (state.clientListStatus == CasualStatus.loading) {
      return const CustomDropdownLoading();
    } else if (state.clientListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return const SizedBox();
    }
  }

  // For Approving Users
  void toggleApproveUser(AuthRoleProfileState state, BuildContext context) {
    if (state.toggleApproveStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.toggleApproveStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.toggleApproveStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.toggleApproveStatus == CasualStatus.not_authorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }

  // Get Network Image
  Widget getImage(
    AuthRoleProfileState state,
    double? height,
    double? width,
    BoxShape shape,
  ) {
    if (state.imageBytesStatus == CasualStatus.success) {
      return Container(
        height: height ?? 30,
        width: width ?? 30,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius:
              (shape != BoxShape.circle)
                  ? BorderRadius.circular(SizesConfig.borderRadiusSm)
                  : null,
          shape: shape,
        ),
        child: Image.memory(state.imageBytes!, fit: BoxFit.cover),
      );
    } else if (state.imageBytesStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height ?? 30,
          width: width ?? 30,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                (shape != BoxShape.circle)
                    ? BorderRadius.circular(SizesConfig.borderRadiusSm)
                    : null,
            shape: shape,
          ),
        ),
      );
    }
  }
}

class LoadingUserHeaderInfo extends StatelessWidget {
  const LoadingUserHeaderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
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
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 8,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(
                      SizesConfig.borderRadiusMd,
                    ),
                  ),
                ),
              ),
              PaddingConfig.h8,
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 8,
                  width: 60,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(
                      SizesConfig.borderRadiusMd,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class UserHeaderInfo extends StatelessWidget {
  const UserHeaderInfo({super.key, required this.employeeEntity});
  final EmployeeEntity employeeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            FetchNetworkImage(
              height: 50,
              width: 50,
              shape: BoxShape.circle,
              imagePath: employeeEntity.image,
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
                employeeEntity.name,
                style: AppTextStyle.bodyMd(color: AppColors.fontDarkGray),
              ),
              Text(
                employeeEntity.role,
                style: AppTextStyle.bodySm(color: AppColors.fontLightGray),
              ),
            ],
          ),
      ],
    );
  }
}
