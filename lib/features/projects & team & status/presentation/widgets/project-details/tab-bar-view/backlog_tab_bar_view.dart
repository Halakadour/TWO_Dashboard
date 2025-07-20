import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';
import 'package:two_dashboard/core/widgets/buttons/icon-buttons/filter_button.dart';
import 'package:two_dashboard/features/projects%20&%20team%20&%20status/presentation/widgets/project-details/backlog_card.dart';

class BacklogTabBarView extends StatelessWidget {
  const BacklogTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CreateElevatedButton(
                  addingType: "New Sprint",
                  onPressed:
                      () => context.pushNamed(AppRouteConfig.createSprint),
                ),
                PaddingConfig.w8,
                FilterButton(onPressed: () {}),
              ],
            ),
            PaddingConfig.h32,
            BacklogCard(title: "Pended Sprint"),
            PaddingConfig.h32,
            BacklogCard(title: "Backlog Sprint"),
            PaddingConfig.h40,
          ],
        ),
      ),
    );
  }
}
