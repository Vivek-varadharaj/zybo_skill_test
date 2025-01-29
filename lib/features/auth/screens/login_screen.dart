import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/common/widgets/custom_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_snackbar.dart';
import 'package:zybo_skill_test/common/widgets/custom_text_field.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';

import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/custom_validator.dart';

import 'package:zybo_skill_test/util/dimensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Dimensions.paddingSizeExtraOverLarge,
              ),
              Text(
                AppTexts.login,
                style: AppTextStyles.heading1,
              ),
              SizedBox(
                height: Dimensions.paddingSizeSmall,
              ),
              Text(
                AppTexts.letsConenct,
                style: AppTextStyles.para2.copyWith(color: AppColors.neutral60),
              ),
              SizedBox(
                height: Dimensions.paddingSizeExtraOverLarge,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            Get.find<AuthController>()
                                .changeSelectedCountry(value);
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 19.sp),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppColors.neutral10))),
                      child:
                          GetBuilder<AuthController>(builder: (authController) {
                        return Text(
                          "+${authController.selectedCountry.phoneCode}",
                          style: AppTextStyles.heading7
                              .copyWith(color: AppColors.neutral80),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.paddingSizeLarge,
                  ),
                  Expanded(
                      child: CustomTextField(
                    textInputType: TextInputType.phone,
                    onChanged: (value) {
                      Get.find<AuthController>().changePhoneNumber(value!);
                    },
                    hintText: AppTexts.enterPhone,
                  ))
                ],
              ),
              SizedBox(height: Dimensions.paddingSizeExtremeLarge),
              GetBuilder<AuthController>(builder: (authController) {
                log(authController.isLoading.toString());
                return CustomButton(
                  isLoading: authController.isLoading,
                  onTap: verify,
                  title: AppTexts.continueText,
                  backgroundColor: AppColors.primary400,
                );
              }),
              SizedBox(height: Dimensions.paddingSizeExtremeLarge),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: "By Continuing you accepting the ",
                        style: AppTextStyles.para5
                            .copyWith(fontWeight: FontWeight.w300)),
                    TextSpan(
                      text: "Terms of Use",
                      style: AppTextStyles.para5.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text: " & ",
                      style: AppTextStyles.para5.copyWith(
                          height: 0.5,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2),
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppTextStyles.para5.copyWith(
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  void verify() async {
    PhoneValid phoneValid = await CustomValidator.isPhoneValid(
        "${Get.find<AuthController>().selectedCountry.phoneCode}${Get.find<AuthController>().phoneNumber}");
    if (phoneValid.isValid) {
      ResponseModel responseModel =
          await Get.find<AuthController>().verifyOtp(loginData: {
        "phone_number":
            "${Get.find<AuthController>().selectedCountry.phoneCode}${Get.find<AuthController>().phoneNumber}"
      });

      if (responseModel.isSuccess) {
        Get.toNamed(Routes.verifyOtp);
      } else {
        showCustomSnackbar(responseModel.message ?? "Getting otp failed");
      }
    } else {
      log("${Get.find<AuthController>().selectedCountry.phoneCode}${Get.find<AuthController>().phoneNumber}");
      showCustomSnackbar("Phone number is not valid");
    }
  }
}
