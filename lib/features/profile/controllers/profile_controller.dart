import 'dart:developer';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:zybo_skill_test/features/profile/domain/models/profile_model.dart';
import 'package:zybo_skill_test/features/profile/domain/repository/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository;
  ProfileController({required this.profileRepository});

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;

  Future<void> getProfile() async {
    try {
      _profileModel = await profileRepository.getProfile();
    } catch (e) {
      log("Error fetching profile: $e");
    }
    update();
  }
}
