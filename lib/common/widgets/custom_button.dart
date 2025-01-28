import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.backgroundColor,
      this.textColor,
      this.fontSize,
      this.onTap,
      this.title});
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final GestureTapCallback? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radiusDefault)),
            backgroundColor: backgroundColor ?? AppColors.primary400,
            textStyle: AppTextStyles.button,
          ),
          onPressed: onTap ?? () {},
          child: Text(
            title ?? "",
            style: AppTextStyles.button,
          )),
    );
  }
}
