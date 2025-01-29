import 'package:get/get.dart';

import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/wishlist/domain/respository/wishlist_repository.dart';

class WishlistController extends GetxController {
  final WishlistRepository wishlistRepository;
  WishlistController({required this.wishlistRepository});

  List<ProductModel>? wishlistProducts = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int? loadingId;

  Future<void> getWishlist() async {
    wishlistProducts = await wishlistRepository.getWishlist();
    update();
  }

  Future<bool> addToWishList(ProductModel product) async {
    loadingId = product.id;
    _isLoading = true;
    update();
    Response response = await wishlistRepository.addToWishList(product.id);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await getWishlist();
      
      await Get.find<HomeController>().toggleFavorite(product);
    }
    _isLoading = false;
    update();
    return response.statusCode == 200;
  }
}
