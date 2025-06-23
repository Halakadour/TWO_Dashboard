import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/project_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/bloc/project_and_team_bloc.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  void didChangeDependencies() {
    context.read<ProjectAndTeamBloc>().add(ShowPendedProjectsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: SizesConfig.lg,
          left: SizesConfig.lg,
          right: SizesConfig.lg,
        ),
        child: Column(
          children: [
            PageTitle(pageTitle: "Pended Requests"),
            PaddingConfig.h32,
            Flexible(
              child: BlocBuilder<ProjectAndTeamBloc, ProjectAndTeamState>(
                buildWhen:
                    (previous, current) =>
                        (previous.pendedProjectListStatus !=
                            current.pendedProjectListStatus),
                builder: (context, state) {
                  return ProjectBlocStateHandling().getPendedProjectsTable(
                    state,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
