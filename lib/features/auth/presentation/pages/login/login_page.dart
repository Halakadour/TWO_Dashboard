import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/auth_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/custom_site_template.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/auth/presentation/pages/login/responsive-pages/login_desktop_tablet.dart';
import 'package:two_dashboard/features/auth/presentation/pages/login/responsive-pages/login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
      listener: (context, state) async {
        await AuthBlocStateHandling().login(state, context);
      },
      listenWhen:
          (previous, current) =>
              previous.authModelStatus != current.authModelStatus,
      child: CustomSiteTemplate(
        currentPageIndex: 0,
        onItemSelected: (p0) {},
        useLayout: false,
        desktop: const LoginDesktopTablet(),
        tablet: const LoginDesktopTablet(),
        mobile: const LoginMobile(),
      ),
    );
  }
}
