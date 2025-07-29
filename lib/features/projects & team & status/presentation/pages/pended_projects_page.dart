import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/project_bloc_state_handling.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_status_team_bloc.dart';

class PendedProjectsPage extends StatefulWidget {
  const PendedProjectsPage({super.key});

  @override
  State<PendedProjectsPage> createState() => _PendedProjectsPageState();
}

class _PendedProjectsPageState extends State<PendedProjectsPage> {
  @override
  void didChangeDependencies() {
    context.read<ProjectStatusTeamBloc>().add(ShowPendedProjectsEvent());
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
              child: BlocBuilder<ProjectStatusTeamBloc, ProjectStatusTeamState>(
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
