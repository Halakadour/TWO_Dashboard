import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/task_bloc_state_handling.dart';
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
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_status_model.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/date_field.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/bloc/sprint_and_task_bloc.dart';

class CreateTaskForm extends StatefulWidget {
  const CreateTaskForm({
    super.key,
    required this.projectTeam,
    required this.projectId,
    required this.sprintId,
  });
  final Team projectTeam;
  final int projectId;
  final int sprintId;

  @override
  State<CreateTaskForm> createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  Member? user;
  String? priority;
  TaskStatus? taskStatus;
  int? statusId;

  DateTime? _startDate;
  DateTime? _endDate;

  List<ProjectStatus> _statusList = [];

  Future<void> _pickDate({required bool isStart}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isStart
              ? (_startDate ?? DateTime.now())
              : (_endDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _loadStatuses() async {
    final allStatuses = getSavedStatusesForProject(widget.projectId);
    print(allStatuses.asMap());
    setState(() {
      _statusList = allStatuses;
    });
  }

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _loadStatuses(); // ← تحميل الحالات
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
                // Task Title
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
                // Task Description
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
                // Assigned To
                Text("Assigned To", style: AppTextStyle.bodySm()),
                PaddingConfig.h16,
                CustomDropdownListForMemberModel(
                  value: user,
                  items:
                      widget.projectTeam.members.map((user) {
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
                    // Priority
                    Text("Priority", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Row(
                        children: [
                          _buildRadioForPriority("High", "High"),
                          PaddingConfig.w24,
                          _buildRadioForPriority("Mid", "Medium"),
                          PaddingConfig.w24,
                          _buildRadioForPriority("Low", "Low"),
                        ],
                      ),
                    ),
                    PaddingConfig.h24,
                    // Status
                    Text("Status", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    if (_statusList.isEmpty)
                      Text(
                        "No statuses available",
                        style: AppTextStyle.bodyXs(),
                      )
                    else
                      Wrap(
                        spacing: 16,
                        children:
                            _statusList
                                .map(_buildRadioForStatusFromHive)
                                .toList(),
                      ),
                    // Date Time
                    PaddingConfig.h16,
                    Row(
                      children: [
                        Expanded(
                          child: DateField(
                            label: 'Start Date',
                            date: _startDate,
                            onTap: () => _pickDate(isStart: true),
                          ),
                        ),
                        PaddingConfig.w16,
                        Expanded(
                          child: DateField(
                            label: 'End Date',
                            date: _endDate,
                            onTap: () => _pickDate(isStart: false),
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
                  BlocListener<SprintAndTaskBloc, SprintAndTaskState>(
                    listener: (context, state) {
                      TaskBlocStateHandling().createTaskListener(
                        state,
                        context,
                      );
                    },
                    listenWhen:
                        (previous, current) =>
                            previous.createTaskStatus !=
                            current.createTaskStatus,
                    child: SaveElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _startDate != null &&
                            _endDate != null &&
                            user != null &&
                            statusId != null &&
                            priority != null) {
                          context.read<SprintAndTaskBloc>().add(
                            CreateTaskEvent(
                              title: _titleController.text,
                              description: _descriptionController.text,
                              projectId: widget.projectId,
                              sprintId: widget.sprintId,
                              statusId: statusId!,
                              userId: user!.id,
                              priority: priority!,
                              completion: 0.0,
                              startDate: HelperFunctions.formateDateForBack(
                                _startDate!,
                              ),
                              endDate: HelperFunctions.formateDateForBack(
                                _endDate!,
                              ),
                            ),
                          );
                        }
                      },
                    ),
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

  Widget _buildRadioForPriority(String value, String label) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: priority,
          activeColor: AppColors.greenShade2,
          onChanged: (String? newValue) {
            setState(() {
              priority = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }

  Widget _buildRadioForStatusFromHive(ProjectStatus status) {
    return Row(
      children: [
        Radio<int>(
          value: status.id,
          groupValue: statusId,
          activeColor: AppColors.greenShade2,
          onChanged: (int? newValue) {
            setState(() {
              statusId = newValue;
            });
          },
        ),
        Text(status.name, style: AppTextStyle.bodySm()),
      ],
    );
  }
}
