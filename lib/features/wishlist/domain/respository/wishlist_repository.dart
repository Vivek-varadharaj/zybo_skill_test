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
    try {
      Response response = await apiClient.getData(
        AppConstants.wishlistApi,
      );
      if (response.statusCode == 200) {
        List responseData = response.body;
        wishList = responseData
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
      } else {
        throw Exception('Failed to load wishlist');
      }
    } catch (e) {
      log('Error fetching wishlist: $e');
      throw Exception('Error fetching wishlist: $e');
    }
    return wishList;
  }

  Future<Response> addToWishList(int id) async {
    try {
      Response response = await apiClient.postData(
          AppConstants.addOrRemoveFromWishlistApi,
          {"product_id": id.toString()},
          handleError: false);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add to wishlist');
      }
      log(response.body.toString());
      return response;
    } catch (e) {
      log('Error adding to wishlist: $e');
      throw Exception('Error adding to wishlist: $e');
    }
  }
}
