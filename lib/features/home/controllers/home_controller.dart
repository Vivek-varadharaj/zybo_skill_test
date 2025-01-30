import 'dart:developer';
import 'package:get/get.dart';
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
    try {
      isLoading = true;
      update();
      await Future.wait([
        getBannerList(),
        getProductList(),
      ]);
    } catch (e) {
      log("Error fetching home page data: $e");
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> getBannerList() async {
    try {
      homeBannerList = await homeRepository.getBannerList();
      log(homeBannerList?.length.toString() ?? "it is null");
    } catch (e) {
      log("Error fetching banners: $e");
    }
  }

  Future<void> getProductList({bool shouldUpdate = false}) async {
    try {
      if (shouldUpdate) {
        isLoading = true;
        update();
      }
      popularProductList = await homeRepository.getProductList();
    } catch (e) {
      log("Error fetching products: $e");
    } finally {
      if (shouldUpdate) {
        isLoading = false;
        update();
      }
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    try {
      int index = popularProductList!.indexWhere((item) => item.id == product.id);
      if (index != -1) {
        if (popularProductList![index].inWishlist == null || !popularProductList![index].inWishlist!) {
          showLottieDialog();
        }
        popularProductList![index] = popularProductList![index].copyWith(
            inWishlist: popularProductList![index].inWishlist == null
                ? true
                : !popularProductList![index].inWishlist!);
      }
      update();
    } catch (e) {
      log("Error toggling favorite: $e");
    }
  }

  void setBannerIndex(int index, bool notify) {
    try {
      _bannerIndex = index;
      if (notify) {
        update();
      }
    } catch (e) {
      log("Error setting banner index: $e");
    }
  }
}
