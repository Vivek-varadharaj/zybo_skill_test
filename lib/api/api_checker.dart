import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_snackbar.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';

class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().logout();
    } else {
      showCustomSnackbar(
        response.statusText ?? "Failed",
      );
    }
  }
}
