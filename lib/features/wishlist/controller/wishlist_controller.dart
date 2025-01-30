import 'dart:developer';

import 'package:get/get.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/wishlist/domain/respository/wishlist_repository.dart';

class WishlistController extends GetxController {
  final WishlistRepository wishlistRepository;
  WishlistController({required this.wishlistRepository});

  List<ProductModel>? _wishlistProducts = [];
  bool _isLoading = false;
  int? _loadingId;

  List<ProductModel>? get wishlistProducts => _wishlistProducts;
  bool get isLoading => _isLoading;
  int? get loadingId => _loadingId;

  Future<void> getWishlist() async {
    try {
      _wishlistProducts = await wishlistRepository.getWishlist();
      update();
    } catch (e) {
      log('Error getting wishlist: $e');
    }
  }

  Future<ResponseModel> addToWishList(ProductModel product) async {
    _loadingId = product.id;
    _isLoading = true;
    update();
    try {
      Response response = await wishlistRepository.addToWishList(product.id);
      if (response.statusCode == 200 || response.statusCode == 201) {
        await getWishlist();
        await Get.find<HomeController>().toggleFavorite(product);
      }
      return ResponseModel(
        response.statusCode == 200 || response.statusCode == 201,
        response.body['message'] ?? "",
      );
    } catch (e) {
      _isLoading = false;
      update();
      log('Error adding to wishlist: $e');
      return ResponseModel(false, 'An error occurred while adding to wishlist');
    } finally {
      _isLoading = false;
      update();
    }
  }
}
