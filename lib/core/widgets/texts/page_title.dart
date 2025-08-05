import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [Text(pageTitle.toUpperCase(), style: AppTextStyle.headerLg())],
    );
  }
}
