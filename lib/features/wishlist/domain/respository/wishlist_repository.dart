import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class WishlistRepository {
  final ApiClient apiClient;

  WishlistRepository({required this.apiClient});
  Future<List<ProductModel>?> getWishlist() async {
    List<ProductModel>? wishList;
    Response response =
        await apiClient.getData(AppConstants.wishlistApi, handleError: false);
    if (response.statusCode == 200) {
      List responseData = response.body;

      wishList = responseData
          .map(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
      return wishList;
    } else {
      return wishList;
    }
  }

  Future<Response> addToWishList(int id) async {
    Response response = await apiClient.postData(
        AppConstants.addOrRemoveFromWishlistApi, {"product_id": id.toString()},
        handleError: false);
    if (response.statusCode == 200) {
      log(response.body.toString());

      return response;
    } else {
      return response;
    }
  }
}
