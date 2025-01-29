import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_image.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      log(homeController.homeBannerList.toString());
      return Column(
        children: [
          CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 335 / 138,
                autoPlay: true,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 7),
                onPageChanged: (index, reason) {
                  homeController.setBannerIndex(index, true);
                },
              ),
              itemCount: homeController.homeBannerList!.isEmpty
                  ? 1
                  : homeController.homeBannerList!.length,
              itemBuilder: (context, index, _) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  child: CustomImage(
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width - 40,
                      image: homeController.homeBannerList![index].image),
                );
              }),
          SizedBox(
            height: Dimensions.paddingSizeDefault,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: homeController.homeBannerList!.map((bnr) {
              int index = homeController.homeBannerList!.indexOf(bnr);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Container(
                  height: 6,
                  width: index != homeController.bannerIndex ? 6 : 20,
                  decoration: BoxDecoration(
                      color: index != homeController.bannerIndex
                          ? AppColors.neutral90.withOpacity(0.2)
                          : AppColors.neutral90,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radiusDefault)),
                ),
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}
