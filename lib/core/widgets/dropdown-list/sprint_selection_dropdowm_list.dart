import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/core/widgets/dropdown-list/custom_dropdown_list_for_project_sprint_model.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/project_sprint.dart';

class SprintSelectionDropdown extends StatefulWidget {
  final List<ProjectSprint> cachedSprints;
  final int openTasksCount;
  final ValueChanged<Map<String, dynamic>>? onActionSelected;

  const SprintSelectionDropdown({
    super.key,
    required this.cachedSprints,
    required this.openTasksCount,
    this.onActionSelected,
  });

  @override
  State<SprintSelectionDropdown> createState() =>
      _SprintSelectionDropdownState();
}

class _SprintSelectionDropdownState extends State<SprintSelectionDropdown> {
  ProjectSprint? _selectedSprint;

  @override
  Widget build(BuildContext context) {
    widget.cachedSprints.addAll([
      ProjectSprint(id: 999, name: "New Sprint", projectId: 999),
      ProjectSprint(id: 888, name: "Backlog", projectId: 888),
    ]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Move Open Work items to :"),
        PaddingConfig.h8,
        CustomDropdownListForProjectSprintModel(
          value: _selectedSprint,
          items:
              widget.cachedSprints.map((sprint) {
                return DropdownMenuItem(
                  value: sprint,
                  child: Text(sprint.name),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedSprint = value;
            });
            if (value!.name.toLowerCase().contains("new")) {
              _selectNewSprint(value.name);
            } else if (value.name.toLowerCase().contains("back")) {
              _selectBacklog();
            } else {
              _selectExistingSprint(value);
            }
          },
        ),
      ],
    );
  }

  void _selectExistingSprint(ProjectSprint sprint) {
    setState(() {
      _selectedSprint = sprint;
    });
    widget.onActionSelected?.call({
      'action': 'existing',
      'existing_sprint_id': sprint.id,
    });
  }

  void _selectNewSprint(String name) {
    setState(() {
      _selectedSprint = null;
    });
    widget.onActionSelected?.call({'action': 'new', 'new_sprint_label': name});
  }

  void _selectBacklog() {
    setState(() {
      _selectedSprint = null;
    });
    widget.onActionSelected?.call({'action': null});
  }
}
