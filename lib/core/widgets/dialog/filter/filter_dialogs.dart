import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/role_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/apply_text_button.dart';
import 'package:two_dashboard/core/widgets/buttons/cancel_text_button.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';
import 'package:two_dashboard/features/posts/presentation/bloc/post_bloc.dart';

class FilterDialogs {
  // Users Filter //
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
              width: 350,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizesConfig.borderRadiusLg),
                color: AppColors.white,
              ),
              child: AlertDialog(
                title: FilterByText(),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FilterOptionTitle(title: "Approvement"),
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
                    FilterOptionTitle(title: "Role"),
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

  // Contact Us Filter //
  void filterContactUs(
    BuildContext context,
    ValueNotifier<bool> seenSelected,
    ValueNotifier<bool> approvedSelected,
  ) {
    showDialog(
      context: context,

      builder:
          (context) => AlertDialog(
            title: FilterByText(),
            content: SizedBox(
              height: SizesConfig.dialogSm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterOptionTitle(title: "Seen"),
                  PaddingConfig.h8,
                  Row(
                    children: [
                      FilterOption(option: "Seen", valueNotifier: seenSelected),
                      PaddingConfig.w8,
                      FilterOption(
                        option: "un seen",
                        valueNotifier: seenSelected,
                        isOposite: true,
                      ),
                    ],
                  ),
                  PaddingConfig.h16,
                  FilterOptionTitle(title: "Approvment"),
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
                ],
              ),
            ),
            actions: [
              const CancelTextButton(),
              ApplyTextButton(
                onPressed: () {
                  context.read<ContactUsBloc>().add(
                    GetContactUsWithSeenAndApprovedEvent(
                      approvedFilter: approvedSelected.value ? 1 : 0,
                      seenFilter: seenSelected.value ? 1 : 0,
                    ),
                  );
                  context.pop();
                },
              ),
            ],
          ),
    );
  }

  // Posts Filter //
  void filterPosts(BuildContext context, ValueNotifier<bool> actriveSelected) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: FilterByText(),
            content: SizedBox(
              height: SizesConfig.dialogXs,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterOptionTitle(title: "Activation"),
                  PaddingConfig.h8,
                  Row(
                    children: [
                      FilterOption(
                        option: "active",
                        valueNotifier: actriveSelected,
                      ),
                      PaddingConfig.w8,
                      FilterOption(
                        option: "not active",
                        valueNotifier: actriveSelected,
                        isOposite: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              const CancelTextButton(),
              ApplyTextButton(
                onPressed: () {
                  context.read<PostBloc>().add(
                    actriveSelected.value
                        ? GetActivePostsEvent()
                        : GetUnActivePostsEvent(),
                  );
                  context.pop();
                },
              ),
            ],
          ),
    );
  }

  // Posts Replies Filter
  Future<dynamic> postRepliesFilter(
    BuildContext context,
    ValueNotifier<bool> acceptedSelected,
    String postId,
  ) {
    return showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: FilterByText(),
            content: SizedBox(
              height: SizesConfig.dialogXs,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterOptionTitle(title: "Acceptance"),
                  PaddingConfig.h8,
                  Row(
                    children: [
                      FilterOption(
                        option: "accepted",
                        valueNotifier: acceptedSelected,
                      ),
                      PaddingConfig.w8,
                      FilterOption(
                        option: "not accepted",
                        valueNotifier: acceptedSelected,
                        isOposite: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              const CancelTextButton(),
              ApplyTextButton(
                onPressed: () {
                  context.read<PostBloc>().add(
                    acceptedSelected.value
                        ? GetPostsAcceptedRepliesEvent(
                          postId: int.parse(postId),
                        )
                        : GetPostsRepliesEvent(postId: int.parse(postId)),
                  );
                  context.pop();
                },
              ),
            ],
          ),
    );
  }

  // Contracts Filter
  void filterContracts(
    BuildContext context,
    ValueNotifier<bool> approvedSelected,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: FilterByText(),
            content: SizedBox(
              height: SizesConfig.dialogSm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterOptionTitle(title: "Approvment"),
                  PaddingConfig.h24,
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
                ],
              ),
            ),
            actions: [
              const CancelTextButton(),
              ApplyTextButton(
                onPressed: () {
                  context.read<ContractBloc>().add(
                    GetContractEvent(filter: approvedSelected.value ? 1 : 0),
                  );
                  context.pop();
                },
              ),
            ],
          ),
    );
  }

  // Filter Drafts
  void filterDrafts(
    BuildContext context,
    ValueNotifier<bool> approvedSelected,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: FilterByText(),
            content: SizedBox(
              height: SizesConfig.dialogSm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterOptionTitle(title: "Approvment"),
                  PaddingConfig.h24,
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
                ],
              ),
            ),
            actions: [
              const CancelTextButton(),
              ApplyTextButton(
                onPressed: () {
                  context.read<ContractBloc>().add(
                    GetDrafEvent(filter: approvedSelected.value ? 1 : 0),
                  );
                  context.pop();
                },
              ),
            ],
          ),
    );
  }
}

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
    required this.option,
    required this.valueNotifier,
    this.isOposite = false,
  });
  final String option;
  final ValueNotifier<bool> valueNotifier;
  final bool isOposite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        valueNotifier.value = !valueNotifier.value;
      },
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder:
            (context, value, child) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    (isOposite)
                        ? !(value)
                            ? AppColors.greenShade2
                            : AppColors.gray
                        : (value)
                        ? AppColors.greenShade2
                        : AppColors.gray,
              ),
              child: Text(
                option,
                style: AppTextStyle.subtitle04(
                  color:
                      (isOposite)
                          ? !(value)
                              ? AppColors.white
                              : AppColors.fontDarkColor
                          : (value)
                          ? AppColors.white
                          : AppColors.fontDarkColor,
                ),
              ),
            ),
      ),
    );
  }
}

class FilterOptionTitle extends StatelessWidget {
  const FilterOptionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title :",
      style: AppTextStyle.subtitle03(color: AppColors.greenShade2),
    );
  }
}

class FilterByText extends StatelessWidget {
  const FilterByText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Filter By :", style: AppTextStyle.subtitle01());
  }
}
