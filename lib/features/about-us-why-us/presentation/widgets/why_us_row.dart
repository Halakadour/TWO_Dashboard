import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:two_dashboard/config/theme/text_style.dart';
import 'package:two_dashboard/features/about-us-why-us/presentation/widgets/custom_linked_text.dart';
import 'package:two_dashboard/lang/locale_keys.g.dart';

class WhyUsRow extends StatelessWidget {
  const WhyUsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(LocaleKeys.whyUs.tr(), style: AppTextStyle.heading02()),
          CustomLinkedText(title: LocaleKeys.seeAll.tr()),
        ],
      ),
    );
  }
}
