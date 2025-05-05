import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/loading_status_animation.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/features/services/presentation/bloc/service_bloc.dart';
import 'package:two_dashboard/features/services/presentation/widgets/service_card.dart';

class ServicesBlocStateHandling {
  // Gte Services
  Widget getServicesTable(ServiceState state) {
    if (state.serviceListStatus == CasualStatus.loading) {
      return Center(child: const LoadingStatusAnimation());
    } else if (state.serviceListStatus == CasualStatus.success) {
      return GridView.builder(
        itemCount: state.serviceList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder:
            (context, index) =>
                ServiceCard(serviceEntity: state.serviceList[index]),
      );
    } else if (state.serviceListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else {
      return const SizedBox();
    }
  }

  // Delete Service
  void deleteService(ServiceState state, BuildContext context) {
    if (state.deleteServiceStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.deleteServiceStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context, () => context.pop());
    } else if (state.deleteServiceStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.deleteServiceStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }

  // Create Service
  void createService(ServiceState state, BuildContext context) {
    if (state.createServiceStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.createServiceStatus == CasualStatus.success) {
      context.pop();
      context.read<ServiceBloc>().add(ShowServicesEvent());
      CustomQuickAlert().successAlert(
        context,
        () => context.pushReplacementNamed(AppRouteConfig.services),
      );
    } else if (state.createServiceStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.createServiceStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().noTokenAlert(context);
    }
  }
}
