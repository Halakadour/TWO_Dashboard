import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/profile_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/dialog/filter/filter_employee.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void didChangeDependencies() {
    context.read<AuthRoleProfileBloc>().add(
      ShowUsersWithFilterEvent(roleFilter: 4),
    );
    context.read<AuthRoleProfileBloc>().add(GetRolesWithoutClientEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: BlocListener<AuthRoleProfileBloc, AuthRoleProfileState>(
          listener: (context, state) {
            ProfileBlocStateHandling().toggleApproveUser(state, context);
          },
          listenWhen:
              (previous, current) =>
                  (previous.toggleApproveStatus != current.toggleApproveStatus),
          child: Column(
            children: [
              const PageTitle(pageTitle: "Employees"),
              const SizedBox(height: SizesConfig.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PaddingConfig.w8,
                  FilterButton(
                    onPressed: () {
                      FilterEmployee().filterUsers(
                        context,
                        ValueNotifier(true),
                        ValueNotifier(2),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: SizesConfig.spaceBtwSections),
              Flexible(
                child: BlocBuilder<AuthRoleProfileBloc, AuthRoleProfileState>(
                  buildWhen:
                      (previous, current) =>
                          (previous.userListStatus != current.userListStatus),
                  builder: (context, state) {
                    return ProfileBlocStateHandling().getUsersTable(state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
