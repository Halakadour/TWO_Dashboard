import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/profile_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/auth/presentation/bloc/auth_role_profile_bloc.dart';
import 'package:two_dashboard/features/profile/domain/entities/client_entity.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/routes/app_route_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../core/functions/bloc-state-handling/contracts_state_handling.dart';
import '../../../../core/widgets/breadcrumbs/breadcumbs_item.dart';
import '../../../../core/widgets/buttons/elevated-buttons/desmiss_elevated_buttom.dart';
import '../../../../core/widgets/buttons/elevated-buttons/save_elevated_button.dart';
import '../../../../core/widgets/layouts/templates/page_template.dart';
import '../../../auth/presentation/widgets/fill-profile/fetch_file_box.dart';
import '../bloc/contract_bloc.dart';

class CreateDraftForm extends StatefulWidget {
  const CreateDraftForm({super.key});

  @override
  State<CreateDraftForm> createState() => _CreateDraftFormState();
}

class _CreateDraftFormState extends State<CreateDraftForm> {
  ClientEntity? clientEntity;
  String? wordBytes;
  void updateWordBytes(String? bytes) {
    setState(() {
      wordBytes = bytes;
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
              paths: [AppRouteConfig.drafts, AppRouteConfig.createDraft],
              pages: ["Drafts", "Create Draft"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Create Draft"),
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
                    child: CustomRounderContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select a client", style: AppTextStyle.bodySm()),
                          PaddingConfig.h16,
                          BlocBuilder<
                            AuthRoleProfileBloc,
                            AuthRoleProfileState
                          >(
                            buildWhen:
                                (previous, current) =>
                                    (previous.clientListStatus !=
                                        current.clientListStatus),
                            builder: (context, state) {
                              return ProfileBlocStateHandling()
                                  .getClientsDropList(state, clientEntity, (
                                    value,
                                  ) {
                                    setState(() {
                                      clientEntity = value;
                                    });
                                  });
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
                          Text("Draft File", style: AppTextStyle.bodySm()),
                          PaddingConfig.h32,
                          FetchFileBox(
                            fileB64: wordBytes,
                            isPDF: false,
                            onUpdate: updateWordBytes,
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
                    if (clientEntity == null) {
                    } else if (wordBytes == null) {
                    } else {
                      context.read<ContractBloc>().add(
                        CreateDrafEvent(
                          draf: wordBytes!,
                          clientId: clientEntity!.cId,
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
