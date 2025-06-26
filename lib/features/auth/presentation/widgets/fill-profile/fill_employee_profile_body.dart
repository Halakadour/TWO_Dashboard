import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/role_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/dialog/global/forget_some_thing_dialog.dart';
import 'package:two_dashboard/core/widgets/images/fetch_image_circle.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/core/widgets/buttons/hovered-buttons/custom_cartoon_button.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/fill-profile/fetch_file_box.dart';
import 'package:two_dashboard/features/roles/data/models/role_response_model.dart';

class FillEmployeeProfileBody extends StatefulWidget {
  const FillEmployeeProfileBody({super.key});

  @override
  State<FillEmployeeProfileBody> createState() =>
      _FillEmployeeProfileBodyState();
}

class _FillEmployeeProfileBodyState extends State<FillEmployeeProfileBody> {
  ValueNotifier<RoleModel?> role = ValueNotifier(null);
  String? imageB64;
  String? cvB64;

  void updateImageBytes(String? base64) {
    setState(() {
      imageB64 = base64;
    });
  }

  void updateCVBytes(String? base64) {
    setState(() {
      cvB64 = base64;
    });
  }

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetRolesWithoutClientEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(TextStrings.fillProfile, style: AppTextStyle.bodyLg()),
        const SizedBox(height: SizesConfig.spaceBtwItems),
        // User Image
        FetchImageCircle(imageB64: imageB64, onUpdate: updateImageBytes),
        const SizedBox(height: SizesConfig.spaceBtwItems),
        // Job Title
        Align(
          alignment: Alignment.topLeft,
          child: Text("Job Title", style: AppTextStyle.bodySm()),
        ),
        PaddingConfig.h8,
        // Roles List
        BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
          buildWhen:
              (previous, current) =>
                  (previous.roleWithoutClientListStatus !=
                      current.roleWithoutClientListStatus),
          builder: (context, state) {
            return RoleBlocStateHandling().getDropDowmRolesList(
              state: state,
              selectedRole: role,
              onChanged: (newRole) => role.value = newRole,
            );
          },
        ),
        PaddingConfig.h16,
        // CV File Box Selecter
        Align(
          alignment: Alignment.topLeft,
          child: Text("CV File", style: AppTextStyle.bodySm()),
        ),
        PaddingConfig.h8,
        FetchFileBox(fileB64: cvB64, onUpdate: updateCVBytes),
        const SizedBox(height: SizesConfig.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: CustomCartoonButton(
            title: TextStrings.tcontinue,
            onTap: () {
              if (imageB64 == null) {
                forgetSomeThingDialog(context, "image");
              } else if (role.value == null) {
                forgetSomeThingDialog(context, "role");
              } else {
                if (cvB64 == null) {
                  forgetSomeThingDialog(context, "cv file");
                } else {
                  context.read<AuthRoleProfileBloc>().add(
                    UpdateEmployeeProfileEvent(
                      image: imageB64!,
                      cv: cvB64!,
                      roleId: role.value!.id,
                    ),
                  );
                }
              }
            },
          ),
        ),
        const SizedBox(height: SizesConfig.spaceBtwItems),
      ],
    );
  }

  // Widget rolesListStateHandling(AuthRoleProfileState state) {
  //   if (state.roleWithoutClientListStatus == CasualStatus.success) {
  //     print("Sucess");
  //     print(state.roleWithoutClientList);
  //     return CustomDropdownListForRoleModel(
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
  //     print("loading");
  //     return const CustomDropdownLoading();
  //   } else if (state.roleWithoutClientListStatus == CasualStatus.failure) {
  //     print("failure ${state.message}");
  //     return Text(state.message);
  //   } else {
  //     print("other");
  //     return const SizedBox();
  //   }
  // }
}
