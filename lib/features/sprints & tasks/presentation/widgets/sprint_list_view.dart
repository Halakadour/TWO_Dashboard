import 'package:flutter/material.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/sprint_list_tile.dart';

import 'sprint_status_title_and_task_count.dart';

class SprintListView extends StatefulWidget {
  const SprintListView({super.key, required this.colorStatus});
  final Color colorStatus;

  @override
  State<SprintListView> createState() => _SprintListViewState();
}

class _SprintListViewState extends State<SprintListView> {
  final List<List<String>> filters = [
    ['To Do', "4"],
    ['In Progress', "3"],
    ['In Review', "8"],
    ['Done', "2"],
  ];
  final List<Color> colorStateList = [
    AppColors.yellowShade2,
    AppColors.blueShade2,
    AppColors.rockShade2,
    AppColors.greenShade2,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getTaskStatusBox(filters[0][0], colorStateList[0], filters[0][1]),
            _getTaskStatusBox(filters[1][0], colorStateList[1], filters[1][1]),
            _getTaskStatusBox(filters[2][0], colorStateList[2], filters[2][1]),
            _getTaskStatusBox(filters[3][0], colorStateList[3], filters[3][1]),
          ],
        ),
        PaddingConfig.h16,
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.gray, width: 0.7),
              borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
            ),
            padding: EdgeInsets.all(16.0),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder:
                  (context, index) =>
                      SprintListTile(colorStatus: widget.colorStatus),
            ),
          ),
        ),
      ],
    );
  }

  Container _getTaskStatusBox(String title, Color color, String count) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      margin: EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
      ),
      child: SprintStatusTitleAndSprintCount(
        title: title,
        colorState: color,
        count: count,
      ),
    );
  }
}
