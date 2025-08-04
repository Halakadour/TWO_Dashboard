import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/routes/app_route_config.dart';
import 'package:two_dashboard/core/widgets/buttons/elevated-buttons/create_elevated_button.dart';

class ContractTabBarView extends StatefulWidget {
  const ContractTabBarView({super.key, required this.projectId});
  final int projectId;

  @override
  State<ContractTabBarView> createState() => _StatusTabBarViewState();
}

class _StatusTabBarViewState extends State<ContractTabBarView> {
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
                  addingType: "Draft",
                  onPressed:
                      () => context.pushNamed(
                        AppRouteConfig.createDraft,
                        pathParameters: {
                          'projectId': widget.projectId.toString(),
                        },
                      ),
                ),
              ],
            ),
            PaddingConfig.h32,
            PaddingConfig.h48,
          ],
        ),
      ),
    );
  }
}
