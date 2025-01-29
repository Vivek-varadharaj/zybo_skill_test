import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_back_button.dart';
import 'package:zybo_skill_test/common/widgets/product_card.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/home/widgets/home_text_field.dart';
import 'package:zybo_skill_test/features/search/controllers/search_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(
                    width: Dimensions.paddingSizeDefault,
                  ),
                  Expanded(child: HomeTextField(isEnabled: true)),
                ],
              ),
              GetBuilder<SearchProductsController>(builder: (controller) {
                return Expanded(
                  child: (controller.searchedProducts.isEmpty) &&
                          controller.query.isNotEmpty
                      ? Center(
                          child: Text(
                            "No products found",
                            style: AppTextStyles.heading3
                                .copyWith(color: AppColors.primary400),
                          ),
                        )
                      : GridView.count(
                          padding: EdgeInsets.zero,
                          mainAxisSpacing: 32,
                          crossAxisSpacing: 16,
                          physics: const ClampingScrollPhysics(),
                          childAspectRatio: 163 / 232,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: controller.query.isEmpty
                              ? Get.find<HomeController>()
                                  .popularProductList!
                                  .map((product) =>
                                      ProductCard(productModel: product))
                                  .toList()
                              : controller.searchedProducts!
                                  .map((product) =>
                                      ProductCard(productModel: product))
                                  .toList(),
                        ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
