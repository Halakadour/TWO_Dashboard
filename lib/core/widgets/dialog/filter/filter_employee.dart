import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import '../../../functions/bloc-state-handling/role_bloc_state_handling.dart';
import '../../buttons/text-buttons/apply_text_button.dart';
import '../../buttons/text-buttons/cancel_text_button.dart';
import 'filter_custom_widgets.dart';

class FilterEmployee {
  // Filter By Approvement & Roles //
  void filterUsers(
    BuildContext context,
    ValueNotifier<bool> approvedSelected,
    ValueNotifier<int> roleSelected,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => Center(
            child: Container(
              width: SizesConfig.dialogWidthXl,
              height: SizesConfig.dialogHightXl,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizesConfig.borderRadiusLg),
                color: AppColors.white,
              ),
              child: AlertDialog(
                title: FilterByText(),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterOptionTitle(
                      title: "Approvement",
                      iconData: Iconsax.activity,
                    ),
                    PaddingConfig.h8,
                    Row(
                      children: [
                        FilterOption(
                          option: "approved",
                          valueNotifier: approvedSelected,
                        ),
                        PaddingConfig.w8,
                        FilterOption(
                          option: "not approved",
                          valueNotifier: approvedSelected,
                          isOposite: true,
                        ),
                      ],
                    ),
                    PaddingConfig.h16,
                    FilterOptionTitle(title: "Role", iconData: Iconsax.bag),
                    PaddingConfig.h8,
                    BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                      buildWhen:
                          (previous, current) =>
                              previous.roleWithoutClientListStatus !=
                              current.roleWithoutClientListStatus,
                      builder: (context, state) {
                        return RoleBlocStateHandling().getRolesForUserFilter(
                          state,
                          roleSelected,
                        );
                      },
                    ),
                  ],
                ),
                actions: [
                  const CancelTextButton(),
                  ApplyTextButton(
                    onPressed: () {
                      context.read<AuthRoleProfileBloc>().add(
                        ShowUsersWithFilterEvent(
                          approvedFilter: approvedSelected.value ? 1 : 0,
                          roleFilter: roleSelected.value,
                        ),
                      );
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
