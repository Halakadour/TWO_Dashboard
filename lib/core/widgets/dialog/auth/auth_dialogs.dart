import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/yes_text_botton.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class AuthDialogs {
  Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Want to logout ? ", style: AppTextStyle.subtitle01()),
            actions: [
              const CancelTextButton(),
              YesTextBotton(
                onPressed: () {
                  context.read<AuthRoleProfileBloc>().add(LogoutUserEvent());
                  context.pushReplacementNamed(AppRouteConfig.login);
                },
              ),
            ],
          ),
    );
  }
}
