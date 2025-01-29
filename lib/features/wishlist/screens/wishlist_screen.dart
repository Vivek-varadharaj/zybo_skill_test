import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:zybo_skill_test/common/widgets/product_card.dart';
import 'package:zybo_skill_test/features/wishlist/controller/wishlist_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.fontSizeDefault,
            ),
            Text(
              AppTexts.wishList,
              style: AppTextStyles.heeboHeading
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: Dimensions.paddingSizeExtraLarge,
            ),
            GetBuilder<WishlistController>(builder: (wishlistController) {
              return Expanded(
                child: (Get.find<WishlistController>().wishlistProducts !=
                            null &&
                        Get.find<WishlistController>()
                            .wishlistProducts!
                            .isNotEmpty)
                    ? GridView.count(
                        mainAxisSpacing: 32,
                        crossAxisSpacing: 16,
                        physics: const ClampingScrollPhysics(),
                        childAspectRatio: 163 / 232,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: wishlistController.wishlistProducts!
                            .map(
                                (product) => ProductCard(productModel: product))
                            .toList(),
                      )
                    : Center(
                        child: Text(
                          "No products found",
                          style: AppTextStyles.heading3
                              .copyWith(color: AppColors.primary400),
                        ),
                      ),
              );
            })
          ],
        ),
      )),
    );
  }
}
