import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/common/widgets/custom_image.dart';
import 'package:zybo_skill_test/common/widgets/custom_snackbar.dart';
import 'package:zybo_skill_test/features/wishlist/controller/wishlist_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/dimensions.dart';
import 'package:zybo_skill_test/util/images.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productModel.images != null && productModel.images!.isNotEmpty
                ? AspectRatio(
                    aspectRatio: 163 / 176,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusLarge),
                        child: CustomImage(image: productModel.images![0])))
                : const SizedBox(),
            SizedBox(height: Dimensions.paddingSizeExtraSmall),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      productModel.mrp != null
                          ? Text(
                              "₹${productModel.mrp!.toStringAsFixed(0)}",
                              style: AppTextStyles.heeboHeading.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: AppColors.neutral60,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: AppColors.neutral60),
                            )
                          : SizedBox(),
                      SizedBox(
                        width: Dimensions.paddingSizeSmall,
                      ),
                      productModel.salePrice != null
                          ? Text(
                              "₹${productModel.salePrice!.toStringAsFixed(0)}",
                              style: AppTextStyles.heeboHeading.copyWith(
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
                      " ${productModel.avgRating?.toStringAsFixed(1) ?? "0"}",
                      style: AppTextStyles.heeboHeading
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            Text(
              productModel.name ?? "",
              style: AppTextStyles.heeboHeading
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
            )
          ],
        ),
        Positioned(
          right: 0,
          child: GetBuilder<WishlistController>(builder: (wishlistController) {
            return IconButton(
                onPressed: () async {
                  onFavoritePressed();
                },
                icon: wishlistController.isLoading &&
                        productModel.id == wishlistController.loadingId
                    ? const Center(
                        child: SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(
                            color: AppColors.primary400,
                          ),
                        ),
                      )
                    : SvgPicture.asset(productModel.inWishlist != null &&
                            productModel.inWishlist!
                        ? Images.heartFilled
                        : Images.heart));
          }),
        )
      ],
    );
  }

  onFavoritePressed() async {
    ResponseModel responseModel =
        await Get.find<WishlistController>().addToWishList(productModel);
    if (responseModel.isSuccess) {
      showCustomSnackbar(responseModel.message ?? "");
    } else {
      showCustomSnackbar(responseModel.message ?? "");
    }
  }
}
