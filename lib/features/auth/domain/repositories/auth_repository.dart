import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepository({required this.sharedPreferences, required this.apiClient});

  Future<Response> registration(Map signUpBody) async {
    try {
      Response response = await apiClient
          .postData(AppConstants.registerApi, signUpBody, handleError: false);
      if (response.statusCode == 200) {
        if (response.body['token'] != null) {
          await saveUserToken(response.body['token']['access']);
        }
        return response;
      }
      throw Exception(response.body['message'] ?? "Registration failed");
    } catch (e) {
      throw Exception("Error during registration: $e");
    }
  }

  Future<Response> verifyOtp(Map signUpBody) async {
    try {
      Response response = await apiClient
          .postData(AppConstants.verifyOtpApi, signUpBody, handleError: false);
      if (response.statusCode == 200) {
        if (response.body['token'] != null) {}
        return response;
      }
      throw Exception(response.body['message'] ?? "OTP verification failed");
    } catch (e) {
      throw Exception("Error during OTP verification: $e");
    }
  }

  Future<bool> saveUserToken(String token) async {
    try {
      apiClient.token = token;
      apiClient.updateHeader(token);
      return await sharedPreferences.setString(AppConstants.token, token);
    } catch (e) {
      throw Exception("Error saving user token: $e");
    }
  }

  String? isUserLoggedIn() {
    try {
      return sharedPreferences.getString(AppConstants.token);
    } catch (e) {
      throw Exception("Error checking login status: $e");
    }
  }

  Future<void> logout() async {
    try {
      await sharedPreferences.remove(AppConstants.token);
    } catch (e) {
      throw Exception("Error during logout: $e");
    }
  }
}
