import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';
import 'package:zybo_skill_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/home/domain/repositories/home_repository.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);
  Get.lazyPut(
      () => ApiClient(
          appBaseUrl: AppConstants.appBaseUrl, sharedPreferences: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => AuthController(
          authRepository: AuthRepository(
              apiClient: Get.find<ApiClient>(),
              sharedPreferences: Get.find<SharedPreferences>())),
      fenix: true);

  Get.lazyPut(
      () => HomeController(
          homeRepository: HomeRepository(apiClient: Get.find<ApiClient>())),
      fenix: true);
}
