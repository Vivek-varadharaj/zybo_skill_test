import 'package:flutter/material.dart';
import 'package:zybo_skill_test/common/widgets/custom_svg_image.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';
import 'package:zybo_skill_test/util/images.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
      margin: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraLarge),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radiusInfinity),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A747474),
            offset: Offset(0, 4),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
        color: AppColors.neutral0,
      ),
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
            decoration: InputDecoration(
                hintStyle: AppTextStyles.latoPara.copyWith(
                    color: AppColors.neutral60, fontWeight: FontWeight.w400),
                isCollapsed: true,
                border: InputBorder.none,
                hintText: AppTexts.search),
          )),
          SizedBox(
            height: 20,
            child: VerticalDivider(
              color: AppColors.neutral100,
              thickness: 2,
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSizeDefault,
          ),
          CustomSvgImage(assetPath: Images.search)
        ],
      ),
    );
  }
}
