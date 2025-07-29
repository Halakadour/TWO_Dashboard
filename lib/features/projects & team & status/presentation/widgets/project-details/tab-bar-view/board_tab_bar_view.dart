import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/task_bloc_state_handling.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/complete_sprint_elevated_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

class BoardTabBarView extends StatefulWidget {
  const BoardTabBarView({super.key, required this.projectId});
  final int projectId;

  @override
  State<BoardTabBarView> createState() => _BoardTabBarViewState();
}

class _BoardTabBarViewState extends State<BoardTabBarView> {
  ValueNotifier<List<int>> selectedSprintIds = ValueNotifier([]);

  Widget _buildSprintFilterList(List<SprintEntity> sprints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          sprints.map((sprint) {
            final isSelected = selectedSprintIds.value.contains(sprint.id);
            return CheckboxListTile(
              value: isSelected,
              onChanged: (val) {
                if (val == true) {
                  selectedSprintIds.value = [
                    ...selectedSprintIds.value,
                    sprint.id,
                  ];
                } else {
                  selectedSprintIds.value =
                      selectedSprintIds.value
                          .where((id) => id != sprint.id)
                          .toList();
                }
                // Get project board based on sprints that I select
                context.read<SprintAndTaskBloc>().add(
                  ShowProjectBoardEvent(
                    projectId: widget.projectId,
                    sprintsIdList: selectedSprintIds.value,
                  ),
                );
              },
              title: Text(sprint.label),
              activeColor: AppColors.blueShade2,
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
            );
          }).toList(),
    );
  }

  @override
  void didChangeDependencies() {
    // Get the project sprints for filtering
    context.read<SprintAndTaskBloc>().add(
      ShowProjectSprintsEvent(projectId: widget.projectId),
    );
    // Get project board for the first time were the list is still empty
    context.read<SprintAndTaskBloc>().add(
      ShowProjectBoardEvent(
        projectId: widget.projectId,
        sprintsIdList: selectedSprintIds.value,
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [CompleteSprintElevatedButton(onPressed: () {})],
            ),
            PaddingConfig.h32,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaddingConfig.w8,
                CustomRounderContainer(
                  height: 200,
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.filter),
                          PaddingConfig.w8,
                          Text("Filter By Sprint:"),
                        ],
                      ),
                      PaddingConfig.h16,
                      BlocBuilder<SprintAndTaskBloc, SprintAndTaskState>(
                        builder: (context, state) {
                          if (state.projectSprintsListStatus ==
                              CasualStatus.loading) {
                            return Center(
                              child: const CircularProgressIndicator(
                                color: AppColors.blueShade2,
                              ),
                            );
                          } else if (state.projectSprintsListStatus ==
                              CasualStatus.success) {
                            if (state.projectSprintsList.isEmpty) {
                              return Text("Empty");
                            } else {
                              //return Text("Susss");
                              return _buildSprintFilterList(
                                state.projectSprintsList,
                              );
                            }
                          } else {
                            return const Text("No sprints available");
                          }
                        },
                      ),
                    ],
                  ),
                ),
                PaddingConfig.w16,
                Expanded(
                  child: BlocBuilder<SprintAndTaskBloc, SprintAndTaskState>(
                    buildWhen:
                        (previous, current) =>
                            previous.projectBoardListStatus !=
                            current.projectBoardListStatus,
                    builder: (context, state) {
                      return TaskBlocStateHandling().getProjectBoardList(
                        state,
                        widget.projectId,
                      );
                    },
                  ),
                ),
              ],
            ),
            PaddingConfig.h48,
          ],
        ),
      ),
    );
  }
}
