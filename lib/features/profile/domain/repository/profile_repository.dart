import 'dart:developer';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/features/profile/domain/models/profile_model.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class ProfileRepository {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<ProfileModel?> getProfile() async {
    try {
      Response response =
          await apiClient.getData(AppConstants.profileApi, handleError: false);
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(response.body);
      } else {
        throw Exception("Failed to load profile: ${response.statusText}");
      }
    } catch (e) {
      log("Error in ProfileRepository: $e");
      throw Exception("An error occurred while fetching the profile.");
    }
  }
}
