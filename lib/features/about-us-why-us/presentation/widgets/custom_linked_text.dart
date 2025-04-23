import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:two_dashboard/config/constants/padding_config.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';
import 'package:two_dashboard/config/theme/color.dart';
import 'package:two_dashboard/config/theme/text_style.dart';

class CustomLinkedText extends StatelessWidget {
  const CustomLinkedText({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.buttonStyle(color: AppColors.greenShade2),
          ),
          PaddingConfig.w8,
          SvgPicture.asset(
            IconsPath.arrowRight,
            // ignore: deprecated_member_use
            color: AppColors.greenShade2,
          ),
        ],
      ),
    );
  }
}
