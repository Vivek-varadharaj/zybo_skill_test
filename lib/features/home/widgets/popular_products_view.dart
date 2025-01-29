import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_image.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class PopularProductsView extends StatelessWidget {
  const PopularProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
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
            physics: ClampingScrollPhysics(),
            childAspectRatio: 163 / 232,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: controller.popularProductList!
                .map(
                  (e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      e.images != null && e.images!.isNotEmpty
                          ? AspectRatio(
                              aspectRatio: 163 / 176,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusLarge),
                                  child: CustomImage(image: e.images![0])))
                          : const SizedBox(),
                      SizedBox(height: Dimensions.paddingSizeExtraSmall),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                e.mrp != null
                                    ? Text(
                                        "₹${e.mrp!.toStringAsFixed(0)}",
                                        style: AppTextStyles.heeboHeading
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                color: AppColors.neutral60,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationThickness: 2,
                                                decorationColor:
                                                    AppColors.neutral60),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  width: Dimensions.paddingSizeSmall,
                                ),
                                e.salePrice != null
                                    ? Text(
                                        "₹${e.salePrice!.toStringAsFixed(0)}",
                                        style: AppTextStyles.heeboHeading
                                            .copyWith(
                                                color: AppColors.primary400,
                                                fontWeight: FontWeight.w700),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.alertGold,
                                size: 20,
                              ),
                              Text(
                                " ${e.avgRating?.toStringAsFixed(1) ?? "0"}",
                                style: AppTextStyles.heeboHeading.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        e.name ?? "",
                        style: AppTextStyles.heeboHeading.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      )
                    ],
                  ),
                )
                .toList(),
          )
        ],
      );
    });
  }
}
