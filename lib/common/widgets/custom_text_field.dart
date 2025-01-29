
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key, this.controller, this.hintText, this.onChanged,  this.textInputType});

  final TextEditingController? controller;
  final String? hintText;
  final Function(String?)? onChanged;
  final TextInputType? textInputType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.neutral10))),
      padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 6.sp),
      child: TextField(
        keyboardType: widget.textInputType,
          onChanged: widget.onChanged,
          controller: widget.controller,
          scrollPadding: EdgeInsets.zero,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            isCollapsed: true,
            hintText: widget.hintText,
            hintStyle:
                AppTextStyles.heading7.copyWith(color: AppColors.neutral80),
            border: InputBorder.none,
          )),
    );
  }
}
