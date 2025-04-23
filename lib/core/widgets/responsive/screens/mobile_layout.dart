import 'package:flutter/material.dart';
import 'package:two_dashboard/core/widgets/layouts/header/header.dart';
import 'package:two_dashboard/core/widgets/layouts/sidebar/sidebar.dart';

// ignore: must_be_immutable
class MobileLayout extends StatelessWidget {
  MobileLayout({
    super.key,
    this.body,
    required this.currentPageIndex,
    required this.onItemSelected,
  });
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  int currentPageIndex;
  dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomSidebar(
        currentPageIndex: currentPageIndex,
        onItemSelected: onItemSelected,
      ),
      appBar: CustomHeader(scaffoldKey: scaffoldKey),
      body: body ?? const SizedBox(),
    );
  }
}
