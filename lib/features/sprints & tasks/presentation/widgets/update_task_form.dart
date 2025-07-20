import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/device_utility.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/core/widgets/dropdown-list/custom_dropdown_list_for_member_model.dart';
import 'package:two_dashboard/core/widgets/images/image_circle.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/data/models/project/team.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/date_field.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

class UpdateTaskForm extends StatefulWidget {
  const UpdateTaskForm({
    super.key,
    required this.taskEntity,
    required this.team,
  });
  final TaskEntity taskEntity;
  final Team team;

  @override
  State<UpdateTaskForm> createState() => _UpdateTaskFormState();
}

class _UpdateTaskFormState extends State<UpdateTaskForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  Member? user;
  TaskPriority? priority;
  TaskStatus? taskStatus;
  int? statusId;
  double? completion;

  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _pickDateTime({required bool isStart}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate:
          isStart
              ? (_startDate ?? DateTime.now())
              : (_endDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
        isStart ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now()),
      ),
    );

    if (pickedTime == null) return;

    final DateTime combined = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      if (isStart) {
        _startDate = combined;
      } else {
        _endDate = combined;
      }
    });
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController(text: widget.taskEntity.title);
    _descriptionController = TextEditingController(
      text: widget.taskEntity.description,
    );
    user = widget.team.members.firstWhere(
      (element) => element.id == int.parse(widget.taskEntity.assignedTo),
    );
    priority = widget.taskEntity.tPriority;
    taskStatus = widget.taskEntity.taskStatus;
    completion = widget.taskEntity.tCompletion;
    _startDate = widget.taskEntity.startDate;
    _endDate = widget.taskEntity.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      runSpacing: 16,
      spacing: 12,
      children: [
        CustomRounderContainer(
          width:
              DeviceUtility.isDesktopScreen(context)
                  ? MediaQuery.of(context).size.width / 2.5 - 32
                  : double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Basic Information", style: AppTextStyle.bodySm()),
                PaddingConfig.h16,
                CustomTextFormField(
                  labelText: "Task Title",
                  controller: _titleController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
                  },
                ),
                PaddingConfig.h16,
                CustomTextFormField(
                  labelText: "Task description",
                  maxLines: 6,
                  controller: _descriptionController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
                  },
                ),
                PaddingConfig.h16,
                Text("Assigned To", style: AppTextStyle.bodySm()),
                PaddingConfig.h16,
                CustomDropdownListForMemberModel(
                  value: user,
                  items:
                      widget.team.members.map((user) {
                        return DropdownMenuItem(
                          value: user,
                          child: Row(
                            children: [
                              ImageCircle(),
                              PaddingConfig.w16,
                              Text(user.name),
                            ],
                          ),
                        );
                      }).toList(),
                  onChanged: (selectedUser) {
                    setState(() {
                      user = selectedUser;
                    });
                  },
                ),
                PaddingConfig.h24,
                // Priority
                Text("Priority", style: AppTextStyle.bodySm()),
                PaddingConfig.h16,
                CustomRounderContainer(
                  child: Row(
                    children: [
                      _buildRadioForPriority(TaskPriority.high, "High"),
                      PaddingConfig.w24,
                      _buildRadioForPriority(TaskPriority.medium, "Medium"),
                      PaddingConfig.w24,
                      _buildRadioForPriority(TaskPriority.low, "Low"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width:
              DeviceUtility.isDesktopScreen(context)
                  ? MediaQuery.of(context).size.width / 2.5 - 32
                  : double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRounderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status
                    Text("Status", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Wrap(
                        children: [
                          _buildRadioForStatus(TaskStatus.toDo, "To Do"),
                          PaddingConfig.w24,
                          _buildRadioForStatus(
                            TaskStatus.inProgress,
                            "In Progress",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForStatus(
                            TaskStatus.completed,
                            "Completed",
                          ),
                        ],
                      ),
                    ),
                    PaddingConfig.h16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Completion", style: AppTextStyle.bodySm()),
                        Text(
                          "${completion?.round()}%",
                          style: AppTextStyle.bodySm(),
                        ),
                      ],
                    ),
                    // Completion
                    Slider(
                      value: completion!,
                      inactiveColor: AppColors.gray,
                      min: 0,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          completion = value;
                        });
                      },
                    ),
                    // Date Time
                    PaddingConfig.h16,
                    Row(
                      children: [
                        Expanded(
                          child: DateField(
                            label: 'Start Date & Time',
                            date: _startDate,
                            onTap: () => _pickDateTime(isStart: true),
                          ),
                        ),
                        PaddingConfig.w16,
                        Expanded(
                          child: DateField(
                            label: 'End Date & Time',
                            date: _endDate,
                            onTap: () => _pickDateTime(isStart: false),
                          ),
                        ),
                      ],
                    ),
                    PaddingConfig.h16,
                    if (_startDate != null && _endDate != null)
                      Text("Task Duration", style: AppTextStyle.bodySm()),
                    if (_startDate != null && _endDate != null)
                      PaddingConfig.h8,
                    if (_startDate != null && _endDate != null)
                      Text(
                        HelperFunctions.getDurationText(_startDate!, _endDate!),
                        style: AppTextStyle.bodyXs(
                          color: AppColors.fontLightGray,
                        ),
                      ),
                  ],
                ),
              ),
              PaddingConfig.h24,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CancelTextButton(),
                  PaddingConfig.w24,
                  SaveElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _startDate != null &&
                          _endDate != null) {}
                    },
                  ),
                ],
              ),
              PaddingConfig.h16,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioForPriority(TaskPriority value, String label) {
    return Row(
      children: [
        Radio<TaskPriority>(
          value: value,
          groupValue: priority,
          activeColor: AppColors.greenShade2,
          onChanged: (TaskPriority? newValue) {
            setState(() {
              priority = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }

  Widget _buildRadioForStatus(TaskStatus value, String label) {
    return Row(
      children: [
        Radio<TaskStatus>(
          value: value,
          groupValue: taskStatus,
          activeColor: AppColors.greenShade2,
          onChanged: (TaskStatus? newValue) {
            setState(() {
              taskStatus = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }
}
