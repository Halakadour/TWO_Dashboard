import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/about_us_why_us_state_handling.dart';
import 'package:two_dashboard/core/widgets/dialog/why-us-about-us/why_us_about_us_dialogs.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/update_elevated_button.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/domain/entities/about_us_entity.dart';
import 'package:two_dashboard/features/about-us%20&%20why-us/presentation/bloc/about_us_why_us_bloc.dart';

class AboutUsWhyUsPage extends StatefulWidget {
  const AboutUsWhyUsPage({super.key});

  @override
  State<AboutUsWhyUsPage> createState() => _AboutUsWhyUsPageState();
}

class _AboutUsWhyUsPageState extends State<AboutUsWhyUsPage> {
  @override
  void didChangeDependencies() {
    context.read<AboutUsWhyUsBloc>().add(GetWhyUsEvent());
    context.read<AboutUsWhyUsBloc>().add(GetAboutUsEvent());
    super.didChangeDependencies();
  }

  final TextEditingController _whyUsController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  AboutUsEntity? aboutUsEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(SizesConfig.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PageTitle(pageTitle: "About Us"),
                Row(
                  children: [
                    // Create About Us
                    BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                      listener: (context, state) {
                        AboutUsWhyUsStateHandling().createAboutUs(
                          state,
                          context,
                        );
                      },
                      listenWhen:
                          (previous, current) =>
                              previous.createAboutUsStatus !=
                              current.createAboutUsStatus,
                      child: CreateElevatedButton(
                        addingType: "About Us",
                        onPressed: () {
                          AboutUsWhyUsDialogs().addAboutUsDialog(
                            context,
                            _timeController,
                            _siteController,
                          );
                        },
                      ),
                    ),
                    PaddingConfig.w8,
                    // Update About Us
                    BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                      listener: (context, state) {
                        AboutUsWhyUsStateHandling().updateAboutUs(
                          state,
                          context,
                        );
                      },
                      listenWhen:
                          (previous, current) =>
                              previous.updateAboutUsStatus !=
                              current.updateAboutUsStatus,
                      child: UpdateElevatedButton(
                        updateType: "About Us",
                        onPressed: () {
                          if (aboutUsEntity != null) {
                            AboutUsWhyUsDialogs().updateAboutUsDialog(
                              context,
                              TextEditingController(
                                text: aboutUsEntity!.aboutWorkTime,
                              ),
                              TextEditingController(
                                text: aboutUsEntity!.aboutSite,
                              ),
                              aboutUsEntity!.aboutId,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PaddingConfig.h16,
            // Displaying About Us
            BlocBuilder<AboutUsWhyUsBloc, AboutUsWhyUsState>(
              builder: (context, state) {
                return AboutUsWhyUsStateHandling().getAboutUs(
                  state,
                  aboutUsEntity,
                );
              },
              buildWhen:
                  (previous, current) =>
                      previous.getAboutUsStatus != current.getAboutUsStatus,
            ),
            PaddingConfig.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PageTitle(pageTitle: "Why Us"),
                // Create Why Us
                BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                  listener: (context, state) {
                    AboutUsWhyUsStateHandling().createWhyUs(state, context);
                  },
                  listenWhen:
                      (previous, current) =>
                          previous.createWhyUsStatus !=
                          current.createWhyUsStatus,
                  child: CreateElevatedButton(
                    addingType: "Why Us",
                    onPressed: () {
                      AboutUsWhyUsDialogs().craeteWhyUsDialog(
                        context,
                        _whyUsController,
                      );
                    },
                  ),
                ),
              ],
            ),
            PaddingConfig.h16,
            // Displaying Why Us
            Flexible(
              child: BlocListener<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                listener: (context, state) {
                  AboutUsWhyUsStateHandling().updateOrDeleteWhyUs(
                    state,
                    context,
                  );
                },
                listenWhen:
                    (previous, current) =>
                        (previous.deleteWhyUsStatus !=
                                current.deleteWhyUsStatus ||
                            previous.updateWhyUsStatus !=
                                current.updateWhyUsStatus),
                child: BlocBuilder<AboutUsWhyUsBloc, AboutUsWhyUsState>(
                  buildWhen:
                      (previous, current) =>
                          (previous.getWhyUsStatus != current.getWhyUsStatus),
                  builder: (context, state) {
                    return AboutUsWhyUsStateHandling().getWhyUsTable(state);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
