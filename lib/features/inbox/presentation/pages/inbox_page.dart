import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/color.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Text("Inbox Page"),
    );
  }
}
