import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contracts_state_handling.dart';
import 'package:two_dashboard/core/widgets/breadcrumbs/breadcumbs_item.dart';
import 'package:two_dashboard/core/widgets/buttons/desmiss_elevated_buttom.dart';
import 'package:two_dashboard/core/widgets/buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/page_template.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/fill-profile/fetch_cv_box.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

class CreateContractForm extends StatefulWidget {
  const CreateContractForm({super.key});

  @override
  State<CreateContractForm> createState() => _CreateContractFormState();
}

class _CreateContractFormState extends State<CreateContractForm> {
  DraftEntity? draftEntity;
  String? pdfBytes;
  void updatePDFBytes(String? bytes) {
    setState(() {
      pdfBytes = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContractBloc, ContractState>(
      listener: (context, state) {
        ContractsStateHandling().createContract(state, context);
      },
      listenWhen:
          (previous, current) =>
              previous.createContractStatus != current.createContractStatus,
      child: PageTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Breadcrumbs(
              paths: [AppRouteConfig.contracts, AppRouteConfig.createContract],
              pages: ["Contracts", "Create Contract"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                ),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Create Contract"),
              ],
            ),
            PaddingConfig.h24,
            SizedBox(
              height: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(SizesConfig.md),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                          SizesConfig.borderRadiusMd,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Source Draft File",
                            style: AppTextStyle.subtitle03(),
                          ),
                          PaddingConfig.h16,
                          BlocBuilder<ContractBloc, ContractState>(
                            buildWhen:
                                (previous, current) =>
                                    (previous.drafListStatus !=
                                        current.drafListStatus),
                            builder: (context, state) {
                              return ContractsStateHandling().getDraftDropList(
                                state,
                                draftEntity,
                                (value) {
                                  setState(() {
                                    draftEntity = value;
                                  });
                                },
                              );
                            },
                          ),
                        ],
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
                          Text(
                            "Contract File",
                            style: AppTextStyle.subtitle03(),
                          ),
                          PaddingConfig.h32,
                          FetchCvBox(
                            fileB64: pdfBytes,
                            onUpdate: updatePDFBytes,
                            changeStyle: true,
                          ),
                          PaddingConfig.h16,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PaddingConfig.h16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const DesmissElevatedButtom(),
                PaddingConfig.w16,
                SaveElevatedButton(
                  onPressed: () {
                    if (draftEntity == null) {
                    } else if (pdfBytes == null) {
                    } else {
                      context.read<ContractBloc>().add(
                        CreateContractEvent(
                          contract: pdfBytes!,
                          clientId: draftEntity!.clientId,
                          drafId: draftEntity!.draftId,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
