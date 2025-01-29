import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_image.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/home/widgets/banner_view.dart';
import 'package:zybo_skill_test/features/home/widgets/home_text_field.dart';
import 'package:zybo_skill_test/features/home/widgets/popular_products_view.dart';
import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
          child: homeController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary400,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.search);
                        },
                        child: const HomeTextField(isEnabled: false,)),
                    Expanded(
                        child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: [
                        if (homeController.homeBannerList != null &&
                            homeController.homeBannerList!.isNotEmpty)
                          const BannerView(),
                        if (homeController.popularProductList != null &&
                            homeController.popularProductList!.isNotEmpty)
                          const PopularProductsView()
                      ],
                    ))
                  ],
                ),
        ),
      );
    });
  }
}
