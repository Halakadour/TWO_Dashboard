import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:two_dashboard/config/strings/assets_path.dart';

class SuccessStatusAnimation extends StatelessWidget {
  const SuccessStatusAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Lottie.asset(JsonPath.success),
    );
  }
}
