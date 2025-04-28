import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class RoleStateHandling {
  Widget getRolesForUserFilter(
    AuthRoleProfileState state,
    ValueNotifier<int> roleSelected,
  ) {
    if (state.roleListStatus == CasualStatus.loading) {
      return CircularProgressIndicator();
    } else if (state.roleListStatus == CasualStatus.success) {
      return ListView(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 5,
            spacing: 5,
            children: List.generate(state.roleList.length, (index) {
              return GestureDetector(
                onTap: () {
                  roleSelected.value = state.roleList[index].id;
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:
                        (state.roleList[index].id == roleSelected.value)
                            ? AppColors.greenShade2
                            : AppColors.gray,
                  ),
                  child: Text(
                    state.roleList[index].role,
                    style: AppTextStyle.subtitle04(
                      color:
                          (state.roleList[index].id == roleSelected.value)
                              ? AppColors.white
                              : AppColors.fontDarkColor,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      );
    } else if (state.roleListStatus == CasualStatus.failure) {
      return Text(state.message);
    } else {
      return SizedBox();
    }
  }
}
