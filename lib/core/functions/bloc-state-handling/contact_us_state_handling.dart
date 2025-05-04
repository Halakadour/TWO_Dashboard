import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/animation/error_status_animation.dart';
import 'package:two_dashboard/core/widgets/animation/unauthorized_status_animation.dart';
import 'package:two_dashboard/core/widgets/quick-alert/custom_quick_alert.dart';
import 'package:two_dashboard/core/widgets/shimmers/table-loading/loading_contact_us_table.dart';
import 'package:two_dashboard/features/contact-us/presentation/bloc/contact_us_bloc.dart';
import 'package:two_dashboard/features/contact-us/presentation/widgets/custom_contact_us_table.dart';

class ContactUsStateHandling {
  Widget getContactUsTable(ContactUsState state) {
    if (state.contactUsListStatus == CasualStatus.loading) {
      return const LoadingContactUsTable();
    } else if (state.contactUsListStatus == CasualStatus.success) {
      return CustomContactUsTable(contactUsList: state.contactUsList);
    } else if (state.contactUsListStatus == CasualStatus.failure) {
      return Center(child: ErrorStatusAnimation(errorMessage: state.message));
    } else if (state.contactUsListStatus == CasualStatus.noToken) {
      return Center(child: UnauthorizedStatusAnimation());
    } else {
      return const SizedBox();
    }
  }

  void toggleContactUsApprovedOrSeen(
    ContactUsState state,
    BuildContext context,
  ) {
    if (state.approvedMarkerStatus == CasualStatus.loading ||
        state.seenMarkerStatus == CasualStatus.loading) {
      CustomQuickAlert().loadingAlert(context);
    } else if (state.approvedMarkerStatus == CasualStatus.success ||
        state.seenMarkerStatus == CasualStatus.success) {
      context.pop();
      CustomQuickAlert().successAlert(context, () {});
    } else if (state.approvedMarkerStatus == CasualStatus.failure ||
        state.seenMarkerStatus == CasualStatus.failure) {
      context.pop();
      CustomQuickAlert().failureAlert(context, state.message);
    } else if (state.approvedMarkerStatus == CasualStatus.noToken ||
        state.seenMarkerStatus == CasualStatus.noToken) {
      context.pop();
      CustomQuickAlert().failureAlert(context, TextStrings.noToken);
    }
  }
}
