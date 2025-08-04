import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contracts_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/dialog/filter/filter_contracts.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

class CMContractsPage extends StatefulWidget {
  const CMContractsPage({super.key});

  @override
  State<CMContractsPage> createState() => _CMContractsPageState();
}

class _CMContractsPageState extends State<CMContractsPage> {
  @override
  void didChangeDependencies() {
    context.read<ContractBloc>().add(ContractManagerShowContractsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: Column(
          children: [
            const PageTitle(pageTitle: "Contract Manager Contracts"),
            const SizedBox(height: SizesConfig.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilterButton(
                  onPressed: () {
                    FilterContracts().filterContracts(
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
                        (previous.contrcatListForCMStatus !=
                            current.contrcatListForCMStatus),
                builder: (context, state) {
                  return ContractsBlocStateHandling().getCMContractsTable(
                    state,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
