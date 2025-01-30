import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/features/auth/domain/models/register_response_model.dart';
import 'package:zybo_skill_test/features/auth/domain/models/verify_otp_model.dart';
import 'package:zybo_skill_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:zybo_skill_test/helper/app_pages.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  VerifyOtpModel? _otpModel;
  VerifyOtpModel? get otpModel => _otpModel;

  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  Country _selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "9123456789",
    displayName: "India (+91)",
    displayNameNoCountryCode: "India",
    e164Key: "91-IN",
  );
  Country get selectedCountry => _selectedCountry;

  RegisterResponse? _registerResponse;
  RegisterResponse? get registerResponse => _registerResponse;

  int _secondsRemaining = 60;
  Timer? _timer;

  int get secondsRemaining => _secondsRemaining;
  bool get isResendEnabled => _secondsRemaining == 0;

  void startTimer() {
    _timer?.cancel();
    _secondsRemaining = 60;
    update();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        update();
      } else {
        timer.cancel();
        update();
      }
    });
  }

  Future<ResponseModel> registration(
      {required String phoneNumber, required String name}) async {
    var body = {"phone_number": phoneNumber, "first_name": name};
    try {
      _isLoading = true;
      update();
      Response response = await authRepository.registration(body);
      _registerResponse = RegisterResponse.fromJson(response.body);
      return ResponseModel(
          response.statusCode == 200, response.body['message']);
    } catch (e) {
      return ResponseModel(false, e.toString());
    } finally {
      _isLoading = false;
      update();
    }
  }

  Future<ResponseModel> verifyOtp({required String phoneNumber}) async {
    var body = {"phone_number": phoneNumber};
    try {
      _isLoading = true;
      update();
      Response response = await authRepository.verifyOtp(body);
      _otpModel = VerifyOtpModel.fromJson(response.body);
      return ResponseModel(response.statusCode == 200, response.body["otp"]);
    } catch (e) {
      return ResponseModel(false, e.toString());
    } finally {
      _isLoading = false;
      update();
    }
  }

  void changeSelectedCountry(Country country) {
    _selectedCountry = country;
    update();
  }

  void changePhoneNumber(String value) {
    _phoneNumber = value;
    update();
  }

  String? getIsUserLoggedIn() {
    try {
      return authRepository.isUserLoggedIn();
    } catch (e) {
      return null;
    }
  }

  void logout() async {
    try {
      await authRepository.logout();
      Get.offAllNamed(Routes.login);
    } catch (e) {}
  }

  Future<void> saveUserToken(String token) async {
    try {
      await authRepository.saveUserToken(token);
    } catch (e) {}
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  
}
