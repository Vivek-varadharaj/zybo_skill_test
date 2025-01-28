import 'package:flutter/material.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              offset: Offset(0, 3),
              blurRadius: 11,
              spreadRadius: 0,
            ),
          ],
          color: AppColors.neutral0,
          borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
      child: const Center(
        child: Icon(
          Icons.arrow_back,
          size: 22,
          color: AppColors.neutral70,
        ),
      ),
    );
  }
}
