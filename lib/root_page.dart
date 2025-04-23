import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/core/widgets/layouts/templates/custom_site_template.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomSiteTemplate(
        currentPageIndex: shell.currentIndex,
        onItemSelected: (index) {
          shell.goBranch(index);
        },
        desktop: Expanded(child: shell),
      ),
    );
  }
}
