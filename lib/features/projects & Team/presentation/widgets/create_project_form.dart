import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/strings/text_strings.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/functions/bloc-state-handling/contracts_bloc_state_handling.dart';
import 'package:two_dashboard/core/helper/helper_functions.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/save_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/text-buttons/cancel_text_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:two_dashboard/features/contracts/domain/entities/contract_entity.dart';
import 'package:two_dashboard/features/contracts/presentation/bloc/contract_bloc.dart';
import 'package:two_dashboard/features/projects%20&%20team/domain/entity/team_entity.dart';
import 'package:two_dashboard/features/projects%20&%20team/presentation/widgets/date_field.dart';

import '../../../../config/constants/padding_config.dart';
import '../../../../config/routes/app_route_config.dart';
import '../../../../core/functions/device_utility.dart';

class CreateProjectForm extends StatefulWidget {
  const CreateProjectForm({super.key});

  @override
  State<CreateProjectForm> createState() => _CreateProjectFormState();
}

class _CreateProjectFormState extends State<CreateProjectForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _projectNameController;
  late final TextEditingController _descriptionController;
  ProjectVisibility? _visibility = ProjectVisibility.public;

  ContractEntity? selectedContract;
  TeamEntity? selectedTeam;

  DateTime? _startDate;
  DateTime? _endDate;

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

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _projectNameController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<ContractBloc>().add(GetContractEvent());
    super.didChangeDependencies();
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
                  labelText: "Project Name",
                  controller: _projectNameController,
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
                Row(
                  children: [
                    Expanded(
                      child: DateField(
                        label: 'Start Date',
                        date: _startDate,
                        onTap: () => _pickDate(isStart: true),
                      ),
                    ),
                    const SizedBox(width: 16),
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
                  Text("Project Duration", style: AppTextStyle.bodySm()),
                if (_startDate != null && _endDate != null) PaddingConfig.h8,
                if (_startDate != null && _endDate != null)
                  Text(
                    HelperFunctions.projectDurationText(_startDate!, _endDate!),
                    style: AppTextStyle.bodyXs(color: AppColors.fontLightGray),
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
                    Text("Team", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (selectedTeam == null)
                                ? "select your team"
                                : selectedTeam!.name,
                            style: AppTextStyle.textfieldStyle(
                              color: AppColors.fontLightGray,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final selected = await context.pushNamed(
                                AppRouteConfig.selectTeam,
                              );
                              if (selected != null && selected is TeamEntity) {
                                setState(() => selectedTeam = selected);
                              }
                            },
                            child: Icon(
                              (selectedTeam == null)
                                  ? Iconsax.add
                                  : Iconsax.edit_2,
                              color: AppColors.greenShade2,
                              size: SizesConfig.iconsSm,
                            ),
                          ),
                        ],
                      ),
                    ),
                    PaddingConfig.h24,
                    Text("Contract", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    // Show Contracts
                    BlocBuilder<ContractBloc, ContractState>(
                      buildWhen:
                          (previous, current) =>
                              previous.contrcatListStatus !=
                              current.contrcatListStatus,
                      builder: (context, state) {
                        return ContractsBlocStateHandling()
                            .getContractsPopuMenu(state, selectedContract, (
                              value,
                            ) {
                              setState(() {
                                selectedContract = value;
                              });
                            });
                      },
                    ),
                    PaddingConfig.h24,
                    Text("Visiblity", style: AppTextStyle.bodySm()),
                    PaddingConfig.h16,
                    CustomRounderContainer(
                      child: Row(
                        children: [
                          _buildRadio(ProjectVisibility.public, "Public"),
                          const SizedBox(width: 24),
                          _buildRadio(ProjectVisibility.private, "Private"),
                        ],
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
                          selectedContract != null &&
                          selectedTeam != null &&
                          _startDate != null &&
                          _endDate != null &&
                          _visibility != null) {
                        //context.read<ProjectAndTeamBloc>().add(
                        // CreateProjectEvent(
                        //   name: _projectNameController.text,
                        //   description: _descriptionController.text,
                        //   contractId: selectedContract!.contractId,
                        //   teamId: selectedTeam!.id,
                        //   startDate: HelperFunctions.formatDate(_startDate!),
                        //   endDate: HelperFunctions.formatDate(_endDate!),
                        //   private: HelperFunctions.getVisibiltyNum(
                        //     _visibility!,
                        //   ),
                        // ),
                        //);
                      }
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

  Widget _buildRadio(ProjectVisibility value, String label) {
    return Row(
      children: [
        Radio<ProjectVisibility>(
          value: value,
          groupValue: _visibility,
          activeColor: AppColors.greenShade2,
          onChanged: (ProjectVisibility? newValue) {
            setState(() {
              _visibility = newValue;
            });
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }
}
