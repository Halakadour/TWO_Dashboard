import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/profile_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/divider/divider_with_text.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/profile/presentation/widgets/general_info_row.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? imageBytes;
  void updateImageBytes(String? bytes) {
    setState(() {
      imageBytes = bytes;
    });
  }

  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(GetUserProfileEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(SizesConfig.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(pageTitle: "User Settings"),
              SizedBox(height: SizesConfig.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(SizesConfig.lg),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          SizesConfig.borderRadiusMd,
                        ),
                      ),
                      child: BlocBuilder<
                        AuthRoleProfileBloc,
                        AuthRoleProfileState
                      >(
                        builder: (context, state) {
                          return ProfileBlocStateHandling().getUserProfilePage(
                            state,
                          );
                        },
                        buildWhen:
                            (previous, current) =>
                                previous.employeeEntityStatus !=
                                current.employeeEntityStatus,
                      ),
                    ),
                  ),
                  PaddingConfig.w16,
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(SizesConfig.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          SizesConfig.borderRadiusMd,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DividerWithText(text: "Genral Settings"),
                          SizedBox(height: SizesConfig.spaceBtwSections),
                          GeneralInfoRow(
                            title: "Language",
                            value: "English",
                            isLang: true,
                          ),
                          GeneralInfoRow(
                            title: "Theme",
                            value: "Light",
                            isLang: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
