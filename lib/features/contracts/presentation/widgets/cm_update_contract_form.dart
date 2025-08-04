import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contracts_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/back_button.dart';
import 'package:two_dashboard/core/widgets/dialog/global/forget_some_thing_dialog.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';

import '../../../../config/constants/sizes_config.dart';
import '../../../../config/routes/app_route_config.dart';
import '../../../../config/theme/color.dart';
import '../../../../core/widgets/breadcrumbs/breadcumbs_item.dart';
import '../../../../core/widgets/buttons/elevated-buttons/desmiss_elevated_buttom.dart';
import '../../../../core/widgets/buttons/elevated-buttons/save_elevated_button.dart';
import '../../../../core/widgets/layouts/templates/page_template.dart';
import '../../../auth/presentation/widgets/fill-profile/fetch_file_box.dart';
import '../bloc/contract_bloc.dart';

class CmUpdateContractForm extends StatefulWidget {
  const CmUpdateContractForm({super.key, required this.contractId});
  final String contractId;

  @override
  State<CmUpdateContractForm> createState() => _CreateDraftFormState();
}

class _CreateDraftFormState extends State<CmUpdateContractForm> {
  String? pdfByte;
  void updatePDFBytes(String? bytes) {
    setState(() {
      pdfByte = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContractBloc, ContractState>(
      listener: (context, state) {
        ContractsBlocStateHandling().updateCMContract(state, context);
      },
      listenWhen:
          (previous, current) =>
              previous.updateContractByCMStatus !=
              current.updateContractByCMStatus,
      child: PageTemplate(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Breadcrumbs(
              paths: [
                AppRouteConfig.cmContracts,
                AppRouteConfig.cmUpdateContract,
              ],
              pages: ["Contract Manager Contracts", "Update Contract"],
            ),
            PaddingConfig.h16,
            Row(
              children: [
                CustomBackButton(),
                PaddingConfig.w8,
                PageTitle(pageTitle: "Update Contract"),
              ],
            ),
            PaddingConfig.h24,
            SizedBox(
              height: 400,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
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
                        Text("New Contract File", style: AppTextStyle.bodySm()),
                        PaddingConfig.h32,
                        FetchFileBox(
                          fileB64: pdfByte,
                          isPDF: false,
                          onUpdate: updatePDFBytes,
                          changeStyle: true,
                        ),
                        PaddingConfig.h16,
                      ],
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
                    if (pdfByte == null) {
                      forgetSomeThingDialog(context, "The New Contract");
                    } else {
                      context.read<ContractBloc>().add(
                        ContractManagerUpdateContractEvent(
                          pdfFilePath: pdfByte!,
                          contractId: widget.contractId,
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
