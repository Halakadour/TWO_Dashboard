import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/container/custom_rounder_container.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/sprint_card.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/domain/entity/sprint_entity.dart';

class SprintsTabBarView extends StatefulWidget {
  const SprintsTabBarView({super.key});

  @override
  State<SprintsTabBarView> createState() => _SprintsTabBarViewState();
}

class _SprintsTabBarViewState extends State<SprintsTabBarView> {
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
      SprintEntity(
        id: 0,
        label: "label",
        description: "description",
        goal: "goal",
        start: DateTime.now(),
        end: DateTime.now(),
        sprintStatus: "sprintStatus",
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CreateElevatedButton(addingType: "New Sprint", onPressed: () {}),
            ],
          ),
          PaddingConfig.h32,
          Expanded(
            child: Row(
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
                      _buildRadio(0, "All Sprints"),
                      PaddingConfig.h8,
                      _buildRadio(1, "Started Sprints"),
                      PaddingConfig.h8,
                      _buildRadio(2, "Un Completed Sprints"),
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
                    itemBuilder:
                        (context, index) =>
                            SprintCard(sprintEntity: list[index]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
