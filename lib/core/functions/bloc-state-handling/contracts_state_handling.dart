import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/dropdown/custom_dropdown_list_for_draft_entity.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/shimmers/dropdown-loading/custom_dropdown_loading.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_contracts_table.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_drafs_table.dart';
import 'package:two_dashboard/features/contracts/domain/entities/draft_entity.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';
import 'package:two_dashboard/features/contracts/presentation/widgets/custom_contract_table.dart';
import 'package:two_dashboard/features/contracts/presentation/widgets/custom_draft_table.dart';

class ContractsStateHandling {
  // Get Contrcat Table
  Widget getContractsTable(ContractState state) {
    if (state.contrcatListStatus == CasualStatus.loading) {
      return const LoadingContractsTable();
    } else if (state.contrcatListStatus == CasualStatus.success) {
      return CustomContractTable(contrcatList: state.contractList);
    } else if (state.contrcatListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else if (state.contrcatListStatus == CasualStatus.noToken) {
      return Center(child: UnauthorizedStatusAnimation());
    } else {
      return const SizedBox();
    }
  }

  // Delete Draft
  void deleteDraft(ContractState state, BuildContext context) {
    if (state.deleteDrafStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deleteDrafStatus == CasualStatus.success) {
      context.pop();
      context.read<ContractBloc>().add(GetDrafEvent());
      CustomQuickAlert().successAlert(context, () => context.pop());
    } else if (state.deleteDrafStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    }
  }

  // Get Draft Table
  Widget getDraftTable(ContractState state) {
    if (state.drafListStatus == CasualStatus.loading) {
      return LoadingDrafsTable();
    } else if (state.drafListStatus == CasualStatus.success) {
      return CustomDraftTable(draftsList: state.drafList);
    } else if (state.drafListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else if (state.drafListStatus == CasualStatus.noToken) {
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
            state.drafList.map((role) {
              return DropdownMenuItem(value: role, child: Text(role.draftPath));
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
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createContractStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context, () => context.pop());
      context.read<ContractBloc>().add(GetContractEvent());
      context.pop();
    } else if (state.createContractStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createContractStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}
