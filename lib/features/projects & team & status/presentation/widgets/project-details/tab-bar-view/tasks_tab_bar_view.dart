import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/network/enums.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/task_card.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/task_entity.dart';

class TasksTabBarView extends StatefulWidget {
  const TasksTabBarView({super.key});

  @override
  State<TasksTabBarView> createState() => _TasksTabBarViewState();
}

class _TasksTabBarViewState extends State<TasksTabBarView> {
  ValueNotifier<int> filter = ValueNotifier(0);

  Widget _buildRadio(int value, String label) {
    return Row(
      children: [
        Radio<int>(
          value: value,
          groupValue: filter.value,
          activeColor: AppColors.blueShade2,
          onChanged: (int? newValue) {
            filter.value = newValue!;
          },
        ),
        Text(label, style: AppTextStyle.bodySm()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = List.filled(
      10,
      TaskEntity(
        id: 0,
        title: "title",
        description: "description",
        taskStatus: TaskStatus.completed,
        assignedTo: "Hala",
        tPriority: TaskPriority.high,
        tCompletion: 20,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
      ),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaddingConfig.w8,
        CustomRounderContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Iconsax.filter),
                  PaddingConfig.w8,
                  Text("Filter :"),
                ],
              ),
              PaddingConfig.h16,
              _buildRadio(0, "All Tasks"),
              PaddingConfig.h8,
              _buildRadio(1, "My Tasks"),
            ],
          ),
        ),
        PaddingConfig.w16,
        Expanded(
          child: GridView.builder(
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => TaskCard(taskEntity: list[index]),
          ),
        ),
      ],
    );
  }
}
