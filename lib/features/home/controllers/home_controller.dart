import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/features/home/domain/models/banner_model.dart';
import 'package:zybo_skill_test/features/home/domain/repositories/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});
  List<BannerModel>? homeBannerList;
  List<ProductModel>? popularProductList;
  bool isLoading = false;
  int _bannerIndex = 0;
  int get bannerIndex => _bannerIndex;

  Future<void> getHomePageData() async {
    isLoading = true;
    update();
    await Future.wait([
      getBannerList(), // First API call
      getProductList(), // Second API call
    ]);
    isLoading = false;
    update();
  }

  Future<void> getBannerList() async {
    homeBannerList = await homeRepository.getBannerList();
    log(homeBannerList?.length.toString() ?? "it is null");
  }

  Future<void> getProductList() async {
    popularProductList = await homeRepository.getProductList();
  }

  void setBannerIndex(int index, bool notify) {
    _bannerIndex = index;
    if (notify) {
      update();
    }
  }
}
