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

  Future<ResponseModel> registration(Map registerModel) async {
    _isLoading = true;
    update();
    Response response = await authRepository.registration(registerModel);
    _registerResponse = RegisterResponse.fromJson(response.body);

    _isLoading = false;
    update();
    return ResponseModel(response.statusCode == 200, response.body['message']);
  }

  Future<ResponseModel> verifyOtp(
      {required Map loginData, bool isOtp = false}) async {
    _isLoading = true;
    update();
    Response response = await authRepository.verifyOtp(loginData);
    _otpModel = VerifyOtpModel.fromJson(response.body);

    _isLoading = false;
    update();
    return ResponseModel(response.statusCode == 200, response.body["otp"]);
  }

  void changeSelectedCountry(Country country) {
    _selectedCountry = country;
    update();
  }

  void changePhoneNumber(String? value) {
    _phoneNumber = value ?? "";
    update();
  }

  String? getIsUserLoggedIn() {
    return authRepository.isUserLoggedIn();
  }

  void logout() async {
    await authRepository.logout();
    Get.offAllNamed(Routes.login);
  }

  Future<void> saveUserToken(String token) async {
    await authRepository.saveUserToken(token);
  }
}
