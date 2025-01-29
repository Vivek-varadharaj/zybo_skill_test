import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/common/widgets/show_lottie_dialog.dart';
import 'package:zybo_skill_test/features/home/domain/models/banner_model.dart';
import 'package:zybo_skill_test/features/home/domain/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});
  List<BannerModel>? homeBannerList = [];
  List<ProductModel>? popularProductList = [];
  bool isLoading = false;
  int _bannerIndex = 0;
  int get bannerIndex => _bannerIndex;

  Future<void> getHomePageData() async {
    isLoading = true;

    update();
    await Future.wait([
      getBannerList(),
      getProductList(),
    ]);
    isLoading = false;
    update();
  }

  Future<void> getBannerList() async {
    homeBannerList = await homeRepository.getBannerList();

    log(homeBannerList?.length.toString() ?? "it is null");
  }

  Future<void> getProductList({bool shouldUpdate = false}) async {
    if (shouldUpdate) {
      isLoading = true;
      update();
    }
    update();
    popularProductList = await homeRepository.getProductList();
    if (shouldUpdate) {
      isLoading = false;
      update();
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    int index = popularProductList!.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      if (popularProductList![index].inWishlist == null ||
          !popularProductList![index].inWishlist!) {
        showLottieDialog();
      }

      popularProductList![index] = popularProductList![index].copyWith(
          inWishlist: popularProductList![index].inWishlist == null
              ? true
              : !popularProductList![index].inWishlist!);
    }
    update();
  }

  void setBannerIndex(int index, bool notify) {
    _bannerIndex = index;
    if (notify) {
      update();
    }
  }
}
