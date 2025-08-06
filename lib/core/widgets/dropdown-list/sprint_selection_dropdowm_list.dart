import 'package:flutter/material.dart';
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
  final TextEditingController _controller = TextEditingController();
  ProjectSprint? _selectedSprint;
  bool _isNewSprint = false;
  bool _isNoneSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.openTasksCount > 0)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "⚠️ يوجد ${widget.openTasksCount} مهام غير منجزة. اختر أين تريد نقلها:",
              style: TextStyle(color: Colors.red[700]),
            ),
          ),
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "اختر Sprint موجودة أو أنشئ جديدة أو Backlog",
            suffixIcon: IconButton(
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: _showDropdown,
            ),
          ),
          readOnly: true,
          onTap: _showDropdown,
        ),
      ],
    );
  }

  void _showDropdown() {
    FocusScope.of(context).unfocus();

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        String customSprintName = '';
        return SizedBox(
          height: 350,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: "أدخل اسم Sprint جديدة",
                    prefixIcon: Icon(Icons.edit),
                  ),
                  onChanged: (value) => customSprintName = value,
                  onSubmitted: (value) {
                    if (value.trim().isEmpty) return;
                    Navigator.pop(context);
                    _selectNewSprint(value);
                  },
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.archive_outlined),
                      title: const Text("Backlog"),
                      onTap: () {
                        Navigator.pop(context);
                        _selectBacklog();
                      },
                    ),
                    ...widget.cachedSprints.map(
                      (sprint) => ListTile(
                        title: Text(sprint.name),
                        onTap: () {
                          Navigator.pop(context);
                          _selectExistingSprint(sprint);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectExistingSprint(ProjectSprint sprint) {
    _controller.text = sprint.name;
    setState(() {
      _selectedSprint = sprint;
      _isNewSprint = false;
      _isNoneSelected = false;
    });
    widget.onActionSelected?.call({
      'action': 'existing',
      'existing_sprint_id': sprint.id,
    });
  }

  void _selectNewSprint(String name) {
    _controller.text = name;
    setState(() {
      _isNewSprint = true;
      _selectedSprint = null;
      _isNoneSelected = false;
    });
    widget.onActionSelected?.call({'action': 'new', 'new_sprint_label': name});
  }

  void _selectBacklog() {
    _controller.text = "Backlog";
    setState(() {
      _isNoneSelected = true;
      _selectedSprint = null;
      _isNewSprint = false;
    });
    widget.onActionSelected?.call({'action': null});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
