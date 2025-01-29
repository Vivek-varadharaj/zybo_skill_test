
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/features/profile/domain/models/profile_model.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

class ProfileRepository {
  final ApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<ProfileModel?> getProfile() async {
    ProfileModel? profile;
    Response response =
        await apiClient.getData(AppConstants.profileApi, handleError: false);
    if (response.statusCode == 200) {
      profile = ProfileModel.fromJson(response.body);
    }
    return profile;
  }
}
