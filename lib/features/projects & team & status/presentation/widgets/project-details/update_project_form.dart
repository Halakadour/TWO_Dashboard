import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/project_bloc_state_handling.dart';
import 'package:two_dashboard/core/functions/device_utility.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/core/widgets/dialog/global/forget_some_thing_dialog.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/domain/entity/project_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/bloc/project_status_team_bloc.dart';

class UpdateProjectForm extends StatefulWidget {
  const UpdateProjectForm({super.key, required this.projectEntity});
  final ProjectEntity projectEntity;

  @override
  State<UpdateProjectForm> createState() => _UpdateProjectFormState();
}

class _UpdateProjectFormState extends State<UpdateProjectForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _clientNameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _requiredmentController;
  late final TextEditingController _durationController;
  late final TextEditingController _costController;
  ProjectType? projectType;
  CooperationType? cooperationType;
  ProjectVisibility? visibility;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _clientNameController = TextEditingController(
      text: widget.projectEntity.fullName,
    );
    _descriptionController = TextEditingController(
      text: widget.projectEntity.projectDescription,
    );
    _requiredmentController = TextEditingController(
      text: widget.projectEntity.requirements,
    );
    _durationController = TextEditingController(
      text: widget.projectEntity.duration,
    );
    _costController = TextEditingController(text: widget.projectEntity.cost);
    projectType = widget.projectEntity.pType;
    cooperationType = widget.projectEntity.cType;
    visibility = widget.projectEntity.visibility;
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
                // Client Name
                CustomTextFormField(
                  labelText: "Client Name",
                  controller: _clientNameController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
                  },
                ),
                PaddingConfig.h16,
                // Project Desription
                CustomTextFormField(
                  labelText: "Project description",
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
                // Project Requirdment
                CustomTextFormField(
                  labelText: "Project Requirdment",
                  maxLines: 6,
                  controller: _requiredmentController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
                  },
                ),
                PaddingConfig.h16,
                // Project Duration
                CustomTextFormField(
                  labelText: "Project Duration",
                  controller: _durationController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
                  },
                ),
                PaddingConfig.h16,
                // Project Cost
                CustomTextFormField(
                  labelText: "Project Cost",
                  controller: _costController,
                  validator: (p0) {
                    if (p0 != null) {
                      return null;
                    } else {
                      return TextStrings.fieldValidation;
                    }
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
                    // Project Type
                    Text("Project Type", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Wrap(
                        children: [
                          _buildRadioForProjectType(
                            ProjectType.mobile,
                            "Mobile Development",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForProjectType(
                            ProjectType.website,
                            "Website Development",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForProjectType(
                            ProjectType.maintain,
                            "Maintain",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForProjectType(
                            ProjectType.softwareTestisng,
                            "Software Testing",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForProjectType(
                            ProjectType.systemAnalysis,
                            "System Analysis",
                          ),
                          PaddingConfig.w24,
                        ],
                      ),
                    ),
                    PaddingConfig.h24,
                    // Coopertion Type
                    Text("Coopertion Type", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Wrap(
                        children: [
                          _buildRadioForCoopertion(
                            CooperationType.development,
                            "Development",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForCoopertion(
                            CooperationType.test,
                            "Testing",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForCoopertion(
                            CooperationType.analysis,
                            "Analysis",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForCoopertion(
                            CooperationType.managment,
                            "Managment",
                          ),
                          PaddingConfig.w24,
                        ],
                      ),
                    ),
                    PaddingConfig.h24,
                    // Visibilty
                    Text("Visibilty", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Row(
                        children: [
                          _buildRadioForVisibilty(
                            ProjectVisibility.private,
                            "Private",
                          ),
                          PaddingConfig.w24,
                          _buildRadioForVisibilty(
                            ProjectVisibility.public,
                            "Public",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              PaddingConfig.h24,
            ],
          ),
        ),
        PaddingConfig.h24,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CancelTextButton(),
            PaddingConfig.w24,
            BlocListener<ProjectStatusTeamBloc, ProjectStatusTeamState>(
              listenWhen:
                  (previous, current) =>
                      previous.updateProjectStatus !=
                      current.updateProjectStatus,
              listener: (context, state) {
                ProjectBlocStateHandling().updateProject(state, context);
              },
              child: SaveElevatedButton(
                onPressed: () {
                  if (projectType == null) {
                    forgetSomeThingDialog(context, "The Project Type");
                  } else if (cooperationType == null) {
                    forgetSomeThingDialog(context, "The cooperation Type");
                  } else if (visibility == null) {
                    forgetSomeThingDialog(context, "The cooperation Type");
                  } else {
                    context.read<ProjectStatusTeamBloc>().add(
                      UpdateProjectEvent(
                        projectId: widget.projectEntity.id,
                        fullName: _clientNameController.text,
                        email: widget.projectEntity.email,
                        phone: widget.projectEntity.phone,
                        projectType: projectType!.name,
                        projectDescription: _descriptionController.text,
                        cost: _costController.text,
                        duration: _durationController.text,
                        companyName: widget.projectEntity.companyName,
                        document: widget.projectEntity.document,
                        requirements: _requiredmentController.text,
                        cooperationType: cooperationType!.name,
                        contactTime: widget.projectEntity.contactTime,
                        visibility:
                            (visibility == ProjectVisibility.public) ? 0 : 1,
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
    );
  }

  /// build radio buttons list for project type chooses
  Widget _buildRadioForProjectType(ProjectType value, String label) {
    return Row(
      children: [
        Radio<ProjectType>(
          value: value,
          groupValue: projectType,
          activeColor: AppColors.blueShade2,
          onChanged: (ProjectType? newValue) {
            setState(() {
              projectType = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }

  /// build radio buttons list for Coopertion Type chooses
  Widget _buildRadioForCoopertion(CooperationType value, String label) {
    return Row(
      children: [
        Radio<CooperationType>(
          value: value,
          groupValue: cooperationType,
          activeColor: AppColors.blueShade2,
          onChanged: (CooperationType? newValue) {
            setState(() {
              cooperationType = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }

  /// build radio buttons list for visibilty chooses
  Widget _buildRadioForVisibilty(ProjectVisibility value, String label) {
    return Row(
      children: [
        Radio<ProjectVisibility>(
          value: value,
          groupValue: visibility,
          activeColor: AppColors.blueShade2,
          onChanged: (ProjectVisibility? newValue) {
            setState(() {
              visibility = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }
}
