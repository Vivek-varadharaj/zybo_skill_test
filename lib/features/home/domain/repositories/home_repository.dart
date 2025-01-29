import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/features/home/domain/models/banner_model.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class HomeRepository {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<List<BannerModel>?> getBannerList() async {
    List<BannerModel>? bannerModel;
    Response response = await apiClient.getData(AppConstants.homeBannerListApi,
        handleError: false);
    if (response.statusCode == 200) {
      List responseData = response.body;
      log(responseData[0]['product'].toString());

      bannerModel = responseData
          .map(
            (e) => BannerModel.fromJson(e),
          )
          .toList();
      return bannerModel;
    } else {
      return bannerModel;
    }
  }

  Future<List<ProductModel>?> getProductList() async {
    List<ProductModel>? bannerModel;
    Response response = await apiClient.getData(AppConstants.productListApi,
        handleError: false);
    if (response.statusCode == 200) {
      List responseData = response.body;
      log(responseData[0]['product'].toString());

      bannerModel = responseData
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
      return bannerModel;
    } else {
      return bannerModel;
    }
  }
}
