import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepository({required this.sharedPreferences, required this.apiClient});

  Future<Response> registration(Map signUpBody) async {
    Response response = await apiClient
        .postData(AppConstants.registerApi, signUpBody, handleError: false);
    if (response.statusCode == 200) {
      if (response.body['token'] != null) {
        await saveUserToken(response.body['token']['access']);
      }
      return response;
    } else {
      return response;
    }
  }

  Future<Response> verifyOtp(Map signUpBody) async {
    Response response = await apiClient
        .postData(AppConstants.verifyOtpApi, signUpBody, handleError: false);
    if (response.statusCode == 200) {
      if (response.body['token'] != null) {
        await saveUserToken(response.body['token']['access']);
      }
      return response;
    } else {
      return response;
    }
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(
      token,
    );
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  String? isUserLoggedIn() {
    return sharedPreferences.getString(AppConstants.token);
  }

  Future<void> logout() async {
    await sharedPreferences.remove(AppConstants.token);
  }
}
