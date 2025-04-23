import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contact_us_state_handling.dart';
import 'package:two_dashboard/core/widgets/buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/dialog/filter/filter_dialogs.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/contact-us/presentation/bloc/contact_us_bloc.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  void didChangeDependencies() {
    context.read<ContactUsBloc>().add(GetContactUsWithSeenAndApprovedEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: BlocListener<ContactUsBloc, ContactUsState>(
          listener: (context, state) {
            ContactUsStateHandling().toggleContactUsApprovedOrSeen(
              state,
              context,
            );
          },
          listenWhen:
              (previous, current) =>
                  (previous.approvedMarkerStatus !=
                          current.approvedMarkerStatus ||
                      previous.seenMarkerStatus != current.seenMarkerStatus),
          child: Column(
            children: [
              const PageTitle(pageTitle: "Contact Us"),
              const SizedBox(height: SizesConfig.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PaddingConfig.w8,
                  FilterButton(
                    onPressed: () {
                      FilterDialogs().filterContactUs(
                        context,
                        ValueNotifier([0, 0]),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: SizesConfig.spaceBtwSections),
              Flexible(
                child: BlocBuilder<ContactUsBloc, ContactUsState>(
                  buildWhen:
                      (previous, current) =>
                          (previous.contactUsListStatus !=
                              current.contactUsListStatus),
                  builder: (context, state) {
                    return ContactUsStateHandling().getContactUsTable(state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
