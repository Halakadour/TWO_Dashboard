import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class RoleBlocStateHandling {
  // Roles for drop down list
  // Widget getDropDownRolesList(AuthRoleProfileState state) {
  //   if (state.roleWithoutClientListStatus == CasualStatus.success) {
  //     return CustomDropdownListForRoleModel(
  //       selectYour: "job",
  //       value: role,
  //       items:
  //           state.roleWithoutClientList.map((role) {
  //             return DropdownMenuItem(value: role, child: Text(role.role));
  //           }).toList(),
  //       onChanged: (value) {
  //         setState(() {
  //           role = value;
  //         });
  //       },
  //     );
  //   } else if (state.roleWithoutClientListStatus == CasualStatus.loading) {
  //     return const CustomDropdownLoading();
  //   } else if (state.roleWithoutClientListStatus == CasualStatus.failure) {
  //     return const Text("No Roles");
  //   } else {
  //     return const SizedBox();
  //   }
  // }

  // Roles For Filter
  Widget getRolesForUserFilter(
    AuthRoleProfileState state,
    ValueNotifier<int> roleSelected,
  ) {
    if (state.roleWithoutClientListStatus == CasualStatus.loading) {
      return CircularProgressIndicator();
    } else if (state.roleWithoutClientListStatus == CasualStatus.success) {
      return SizedBox(
        width: 450,
        height: 150,
        child: ListView(
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              runSpacing: 5,
              spacing: 5,
              children: List.generate(state.roleWithoutClientList.length, (
                index,
              ) {
                return GestureDetector(
                  onTap: () {
                    roleSelected.value = state.roleWithoutClientList[index].id;
                  },
                  child: ValueListenableBuilder(
                    valueListenable: roleSelected,
                    builder:
                        (context, value, child) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 9,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.blueShade1),
                            borderRadius: BorderRadius.circular(
                              SizesConfig.borderRadiusXs,
                            ),
                            color:
                                (state.roleWithoutClientList[index].id ==
                                        roleSelected.value)
                                    ? AppColors.blueShade1
                                    : Colors.transparent,
                          ),
                          child: Text(
                            state.roleWithoutClientList[index].role,
                            style: AppTextStyle.bodyXs(
                              color:
                                  (state.roleWithoutClientList[index].id ==
                                          roleSelected.value)
                                      ? AppColors.blueShade2
                                      : AppColors.blueShade1,
                            ),
                          ),
                        ),
                  ),
                );
              }),
            ),
          ],
        ),
      );
    } else if (state.roleWithoutClientListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return SizedBox();
    }
  }
}
