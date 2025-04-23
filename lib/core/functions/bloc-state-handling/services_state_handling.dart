import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_service_table.dart';
import 'package:two_dashboard/features/services/presentation/bloc/service_bloc.dart';
import 'package:two_dashboard/features/services/presentation/widgets/custom_service_table.dart';

class ServicesStateHandling {
  Widget getServicesTable(ServiceState state) {
    if (state.serviceListStatus == CasualStatus.loading) {
      return const LoadingServiceTable();
    } else if (state.serviceListStatus == CasualStatus.success) {
      return CustomServiceTable(serviceList: state.serviceList);
    } else if (state.serviceListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  void deleteService(ServiceState state, BuildContext context) {
    if (state.deleteServiceStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deleteServiceStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context);
    } else if (state.deleteServiceStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deleteServiceStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }
}
