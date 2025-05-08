import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contracts_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/dialog/filter/filter_contracts.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

class DraftsPage extends StatefulWidget {
  const DraftsPage({super.key});

  @override
  State<DraftsPage> createState() => _DraftsPageState();
}

class _DraftsPageState extends State<DraftsPage> {
  @override
  void didChangeDependencies() {
    context.read<ContractBloc>().add(GetDrafEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: BlocListener<ContractBloc, ContractState>(
          listener: (context, state) {
            ContractsStateHandling().deleteDraft(state, context);
          },
          listenWhen:
              (previous, current) =>
                  previous.deleteDrafStatus != current.deleteDrafStatus,
          child: Column(
            children: [
              const PageTitle(pageTitle: "Drafts"),
              const SizedBox(height: SizesConfig.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CreateElevatedButton(addingType: "Draft", onPressed: () {}),
                  PaddingConfig.w8,
                  FilterButton(
                    onPressed: () {
                      FilterContracts().filterDrafts(
                        context,
                        ValueNotifier(false),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: SizesConfig.spaceBtwSections),
              Flexible(
                child: BlocBuilder<ContractBloc, ContractState>(
                  buildWhen:
                      (previous, current) =>
                          (previous.drafListStatus != current.drafListStatus),
                  builder: (context, state) {
                    return ContractsStateHandling().getDraftTable(state);
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
