import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/device_utility.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/update_elevated_button.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/cooperation_type_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/dynamic_status_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/project_type_status_container.dart';
import 'package:two_dashboard/core/widgets/container/status-containers/visibility_status_container.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';

class SummaryTabBarView extends StatelessWidget {
  const SummaryTabBarView({super.key, required this.projectEntity});
  final ProjectEntity projectEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UpdateElevatedButton(
                  updateType: "Project",
                  onPressed:
                      () => context.pushNamed(
                        AppRouteConfig.updateProject,
                        extra: projectEntity,
                      ),
                ),
              ],
            ),
            PaddingConfig.h24,
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 16,
              spacing: 12,
              children: [
                SizedBox(
                  width:
                      DeviceUtility.isMobileScreen(context)
                          ? double.infinity
                          : MediaQuery.of(context).size.width / 2.5 - 32,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Iconsax.profile_circle,
                            color: AppColors.blueShade2,
                          ),
                          PaddingConfig.w8,
                          Text(
                            "Client Name",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 75),
                          Text(
                            projectEntity.fullName,
                            style: AppTextStyle.bodySm(
                              color: AppColors.fontLightGray,
                            ),
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.building, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Company Name",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 50),
                          Text(
                            projectEntity.companyName,
                            style: AppTextStyle.bodySm(
                              color: AppColors.fontLightGray,
                            ),
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.brush_1, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Project Descreption",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          PaddingConfig.w24,
                          Flexible(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                projectEntity.projectDescription,
                                style: AppTextStyle.bodySm(
                                  color: AppColors.fontLightGray,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Iconsax.receipt_2_1,
                            color: AppColors.blueShade2,
                          ),
                          PaddingConfig.w8,
                          Text(
                            "Project Requirdment",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          PaddingConfig.w24,
                          Flexible(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                projectEntity.requirements,
                                style: AppTextStyle.bodySm(
                                  color: AppColors.fontLightGray,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.clock, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Project Duration",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          PaddingConfig.w56,
                          Text(
                            projectEntity.duration,
                            style: AppTextStyle.bodySm(
                              color: AppColors.fontLightGray,
                            ),
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.money, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Project Cost",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 84),
                          Text(
                            projectEntity.cost,
                            style: AppTextStyle.bodySm(
                              color: AppColors.fontLightGray,
                            ),
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                    ],
                  ),
                ),
                PaddingConfig.w16,
                SizedBox(
                  width:
                      DeviceUtility.isMobileScreen(context)
                          ? double.infinity
                          : MediaQuery.of(context).size.width / 2.5 - 32,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.brush, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Project Type",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 84),
                          ProjectTypeStatusContainer(
                            projectType: projectEntity.pType,
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.people, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Cooperation Type",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 44),
                          CooperationTypeContainer(
                            cooperationType: projectEntity.cType,
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.eye, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Visibilty",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 120),
                          VisibilityStatusContainer(
                            visibility: projectEntity.visibility,
                          ),
                        ],
                      ),
                      PaddingConfig.h24,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Iconsax.status, color: AppColors.blueShade2),
                          PaddingConfig.w8,
                          Text(
                            "Project Status",
                            style: AppTextStyle.bodyMd(
                              color: AppColors.blueShade2,
                            ),
                          ),
                          SizedBox(width: 80),
                          DynamicStatusContainer(status: projectEntity.status),
                        ],
                      ),
                      PaddingConfig.h24,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
