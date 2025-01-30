import 'dart:async';
import 'dart:developer';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/features/search/domain/repositories/search_repository.dart';

class SearchProductsController extends GetxController {
  final SearchRepository searchRepository;
  SearchProductsController({required this.searchRepository});
  Timer? _debounce;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String query = "";
  List<ProductModel> _searchedProducts = [];
  List<ProductModel> get searchedProducts => _searchedProducts;

  Future<void> searchProducts() async {
    try {
      _isLoading = true;
      update();
      _searchedProducts = await searchRepository.searchProducts(query);
    } catch (e) {
      log("Error in searchProducts: $e");
      _searchedProducts = [];
    } finally {
      _isLoading = false;
      update();
    }
  }

  void changeQuery(String value) {
    query = value;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      await searchProducts();
    });
  }
}
