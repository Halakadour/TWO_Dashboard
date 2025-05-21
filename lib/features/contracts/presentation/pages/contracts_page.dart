import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contracts_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/dialog/filter/filter_contracts.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  @override
  void didChangeDependencies() {
    context.read<ContractBloc>().add(GetContractEvent(filter: 1));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: Column(
          children: [
            const PageTitle(pageTitle: "Contracts"),
            const SizedBox(height: SizesConfig.spaceBtwSections),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateElevatedButton(
                  addingType: "Contract",
                  onPressed: () {
                    context.pushNamed(AppRouteConfig.createContract);
                  },
                ),
                PaddingConfig.w8,
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
                        (previous.contrcatListStatus !=
                            current.contrcatListStatus),
                builder: (context, state) {
                  return ContractsBlocStateHandling().getContractsTable(state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
