import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/contracts/contract_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/contracts/loading_contract_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/draft/draft_table.dart';
import 'package:two_dashboard/core/widgets/data-table/custom/draft/loading_draft_table.dart';
import 'package:two_dashboard/core/widgets/dialog/status/error_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/loading_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/not_authorized_dialog.dart';
import 'package:two_dashboard/core/widgets/dialog/status/success_dialog.dart';
import 'package:two_dashboard/core/widgets/dropdown-list/custom_dropdown_list_for_draft_entity.dart';
import 'package:two_dashboard/core/widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';

import '../../../config/routes/app_route_config.dart';
import '../../../features/contracts/domain/entities/contract_entity.dart';
import '../../widgets/menus/custom_popu_menu_for_contract_entity.dart';

class ContractsBlocStateHandling {
  // Get Contrcat Table
  Widget getContractsTable(ContractState state) {
    if (state.contrcatListStatus == CasualStatus.loading) {
      return const LoadingContractTable();
    } else if (state.contrcatListStatus == CasualStatus.success) {
      return ContractTable(contractList: state.contractList);
    } else if (state.contrcatListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else if (state.contrcatListStatus == CasualStatus.not_authorized) {
      return Center(child: UnauthorizedStatusAnimation());
    } else {
      return const SizedBox();
    }
  }

  // Get Contract Popumenu
  Widget getContractsPopuMenu(
    ContractState state,
    ContractEntity? contractEntity,
    void Function(ContractEntity)? onSelected,
  ) {
    if (state.contrcatListStatus == CasualStatus.loading) {
      return const CustomDropdownLoading();
    } else if (state.contrcatListStatus == CasualStatus.success) {
      return CustomPopuMenuForContractEntity(
        selectYour: "Contract File",
        value: contractEntity,
        items:
            state.contractList.map((contract) {
              return PopupMenuItem(
                value: contract,
                child: Text(contract.contractPath),
              );
            }).toList(),
        onSelected: onSelected,
      );
    } else if (state.contrcatListStatus == CasualStatus.failure) {
      return const Text("No Contrcats");
    } else {
      return const SizedBox();
    }
  }

  // Add Client Sign
  void addSign(ContractState state, BuildContext context) {
    if (state.addSignStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.addSignStatus == CasualStatus.success) {
      context.pop();
      context.read<ContractBloc>().add(GetContractEvent());
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.addSignStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    }
  }

  // Delete Draft
  void deleteDraft(ContractState state, BuildContext context) {
    if (state.deleteDrafStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.deleteDrafStatus == CasualStatus.success) {
      context.pop();
      context.read<ContractBloc>().add(GetDrafEvent());
      showSuccessDialog(context, () {
        context.pop();
      });
    } else if (state.deleteDrafStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    }
  }

  // Get Draft Table
  Widget getDraftTable(ContractState state) {
    if (state.drafListStatus == CasualStatus.loading) {
      return LoadingDraftTable();
    } else if (state.drafListStatus == CasualStatus.success) {
      return DraftTable(draftList: state.drafList);
    } else if (state.drafListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else if (state.drafListStatus == CasualStatus.not_authorized) {
      return Center(child: UnauthorizedStatusAnimation());
    }
    {
      return SizedBox();
    }
  }

  Widget getDraftDropList(
    ContractState state,
    DraftEntity? draftEntity,
    void Function(DraftEntity?)? onChanged,
  ) {
    if (state.drafListStatus == CasualStatus.success) {
      return CustomDropdownListForDraftEntity(
        selectYour: "draft",
        value: draftEntity,
        items:
            state.drafList.map((draft) {
              return DropdownMenuItem(
                value: draft,
                child: Text(draft.draftPath),
              );
            }).toList(),
        onChanged: onChanged,
      );
    } else if (state.drafListStatus == CasualStatus.loading) {
      return const CustomDropdownLoading();
    } else if (state.drafListStatus == CasualStatus.failure) {
      return const Text("No Drafts");
    } else {
      return const SizedBox();
    }
  }

  void createContract(ContractState state, BuildContext context) {
    if (state.createContractStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createContractStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.contracts);
        context.pop();
      });
      context.read<ContractBloc>().add(GetContractEvent());
    } else if (state.createContractStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.createContractStatus == CasualStatus.not_authorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }

  void createDraft(ContractState state, BuildContext context) {
    if (state.createDrafStatus == CasualStatus.loading) {
      showLoadingDialog(context);
    } else if (state.createDrafStatus == CasualStatus.success) {
      context.pop();
      showSuccessDialog(context, () {
        context.pushReplacementNamed(AppRouteConfig.drafts);
        context.pop();
      });
      context.read<ContractBloc>().add(GetDrafEvent());
      context.pop();
    } else if (state.createDrafStatus == CasualStatus.failure) {
      context.pop();
      showErrorDialog(context, state.message);
    } else if (state.createDrafStatus == CasualStatus.not_authorized) {
      context.pop();
      showNotAuthorizedDialog(context);
    }
  }
}
