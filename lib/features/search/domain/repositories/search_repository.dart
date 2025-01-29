import 'package:get/get_connect/http/src/response/response.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class SearchRepository {
  final ApiClient apiClient;

  SearchRepository({required this.apiClient});
  Future<List<ProductModel>> searchProducts(String query) async {
    List<ProductModel> wishList = [];
    Response response = await apiClient.postData(
        AppConstants.searchProductApi, {"query": query},
        handleError: false);
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
}
