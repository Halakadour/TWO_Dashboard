import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/choose_date_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/sort_by_button.dart';
import 'package:two_dashboard/core/widgets/texts/page_title.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/sprint_kanban_view.dart';
import 'package:two_dashboard/features/sprints%20&%20tasks/presentation/widgets/sprint_list_view.dart';

class SprintPage extends StatefulWidget {
  const SprintPage({super.key});

  @override
  SprintPageState createState() => SprintPageState();
}

class SprintPageState extends State<SprintPage> {
  bool isKanban = true;
  String filter = 'All';
  String sortBy = 'Date';

  final List<String> filters = [
    'All',
    'To Do',
    'In Progress',
    'In Review',
    'Done',
  ];
  final List<String> sortOptions = ['Date', 'Progress', 'Title'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: SizesConfig.lg,
          left: SizesConfig.lg,
          right: SizesConfig.lg,
        ),
        child: Column(
          children: [
            PageTitle(pageTitle: "Task Board"),
            PaddingConfig.h24,
            _buildFilters(),
            PaddingConfig.h24,
            Expanded(
              child:
                  isKanban
                      ? SprintKanbanView()
                      : SprintListView(colorStatus: AppColors.yellowShade2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleBar() {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.rockShade2, width: 0.2),
        borderRadius: BorderRadius.circular(SizesConfig.borderRadiusXl),
      ),
      padding: EdgeInsets.all(3.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Iconsax.kanban),
            iconSize: SizesConfig.iconsSm,
            padding: EdgeInsets.all(0.0),
            style: IconButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor:
                  isKanban ? AppColors.greenShade2 : Colors.transparent,
            ),
            onPressed: () => setState(() => isKanban = true),
            color: isKanban ? AppColors.white : Colors.grey,
          ),
          PaddingConfig.w8,
          IconButton(
            icon: Icon(Iconsax.element_4),
            iconSize: SizesConfig.iconsSm,
            padding: EdgeInsets.all(0.0),
            style: IconButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor:
                  !isKanban ? AppColors.greenShade2 : Colors.transparent,
            ),
            onPressed: () => setState(() => isKanban = false),
            color: !isKanban ? AppColors.white : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ChooseDateButton(),
          PaddingConfig.w16,
          SortByButton(onPressed: () {}),
          PaddingConfig.w16,
          FilterButton(onPressed: () {}),
          PaddingConfig.w16,
          _buildToggleBar(),
        ],
      ),
    );
  }
}
