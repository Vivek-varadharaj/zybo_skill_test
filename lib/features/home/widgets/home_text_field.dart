import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_svg_image.dart';
import 'package:zybo_skill_test/features/home/screens/home_screen.dart';
import 'package:zybo_skill_test/features/search/bloc/search_bloc.dart';
import 'package:zybo_skill_test/features/search/controllers/search_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';
import 'package:zybo_skill_test/util/images.dart';

class HomeTextField extends StatefulWidget {
  const HomeTextField({super.key, required this.isEnabled});
  final bool isEnabled;

  @override
  State<HomeTextField> createState() => _HomeTextFieldState();
}

class _HomeTextFieldState extends State<HomeTextField> {
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
            onChanged: (value) {
              context.read<SearchBloc>().add(SearchingWithQuery(query: value));
            },
            readOnly: !widget.isEnabled,
            enabled: widget.isEnabled,
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
