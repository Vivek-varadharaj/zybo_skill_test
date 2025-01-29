import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/product_card.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class PopularProductsView extends StatelessWidget {
  const PopularProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.paddingSizeExtraLarge,
              ),
              Text(
                AppTexts.popularProduct,
                style: AppTextStyles.heeboHeading,
              ),
              SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              GridView.count(
                mainAxisSpacing: 32,
                crossAxisSpacing: 16,
                physics: const ClampingScrollPhysics(),
                childAspectRatio: 163 / 232,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: controller.popularProductList!
                    .map((product) => ProductCard(productModel: product))
                    .toList(),
              )
            ],
          ),
        ],
      );
    });
  }
}
