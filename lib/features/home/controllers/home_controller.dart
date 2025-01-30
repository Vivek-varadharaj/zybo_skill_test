import 'dart:developer';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/common/widgets/show_lottie_dialog.dart';
import 'package:zybo_skill_test/features/home/domain/models/banner_model.dart';
import 'package:zybo_skill_test/features/home/domain/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

  List<BannerModel>? _homeBannerList = [];
  List<ProductModel>? _popularProductList = [];
  bool _isLoading = false;
  int _bannerIndex = 0;

  List<BannerModel>? get homeBannerList => _homeBannerList;
  List<ProductModel>? get popularProductList => _popularProductList;
  bool get isLoading => _isLoading;
  int get bannerIndex => _bannerIndex;

  Future<void> getHomePageData() async {
    try {
      _isLoading = true;
      update();
      await Future.wait([
        getBannerList(),
        getProductList(),
      ]);
    } catch (e) {
      log("Error fetching home page data: $e");
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<void> getBannerList() async {
    try {
      _homeBannerList = await homeRepository.getBannerList();
      log(_homeBannerList?.length.toString() ?? "it is null");
    } catch (e) {
      log("Error fetching banners: $e");
    }
  }

  Future<void> getProductList({bool shouldUpdate = false}) async {
    try {
      if (shouldUpdate) {
        _isLoading = true;
        update();
      }
      _popularProductList = await homeRepository.getProductList();
    } catch (e) {
      log("Error fetching products: $e");
    } finally {
      if (shouldUpdate) {
        _isLoading = false;
        update();
      }
    }
  }

  Future<void> toggleFavorite(ProductModel product) async {
    try {
      int index =
          _popularProductList!.indexWhere((item) => item.id == product.id);
      if (index != -1) {
        if (_popularProductList![index].inWishlist == null ||
            !_popularProductList![index].inWishlist!) {
          showLottieDialog();
        }
        _popularProductList![index] = _popularProductList![index].copyWith(
            inWishlist: _popularProductList![index].inWishlist == null
                ? true
                : !_popularProductList![index].inWishlist!);
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
