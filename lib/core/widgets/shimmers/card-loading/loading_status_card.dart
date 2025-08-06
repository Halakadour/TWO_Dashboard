import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:two_dashboard/config/constants/sizes_config.dart';
import 'package:two_dashboard/config/theme/color.dart';

class LoadingStatusCard extends StatelessWidget {
  const LoadingStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizesConfig.borderRadiusMd,
                    ),
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
