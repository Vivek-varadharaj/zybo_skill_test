import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:pinput/pinput.dart';
import 'package:zybo_skill_test/common/widgets/custom_back_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_snackbar.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';

import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late TextEditingController pinputController;
  @override
  void initState() {
    super.initState();
    pinputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.only(right: 8),
      width: 75.5,
      height: 58,
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, -2),
            color: const Color.fromARGB(255, 85, 83, 83).withOpacity(0.3),
          ),
          const BoxShadow(
            color: Color(0xffF6F6F6),
            spreadRadius: 0.0,
            blurRadius: 4.0,
          ),
        ],
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              Expanded(
                  child: ListView(
                padding:
                    EdgeInsets.only(top: Dimensions.paddingSizeExtraOverLarge),
                children: [
                  Text(
                    AppTexts.otpVerification,
                    style: AppTextStyles.heading3,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeDefault,
                  ),
                  GetBuilder<AuthController>(builder: (authController) {
                    return RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: AppTexts.enterTheOtpSentTo,
                              style: AppTextStyles.para2.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.neutral60)),
                          TextSpan(
                            text:
                                "+${authController.selectedCountry.phoneCode}-${authController.phoneNumber}",
                            style: AppTextStyles.heading7.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.neutral100,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraOverLarge,
                  ),
                  GetBuilder<AuthController>(builder: (authController) {
                    return RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: AppTexts.otpIs,
                              style: AppTextStyles.heading7.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.neutral100)),
                          TextSpan(
                            text: authController.otpModel?.otp ?? "",
                            style: AppTextStyles.heading3.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary400,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraOverLarge,
                  ),
                  Pinput(
                    controller: pinputController,
                    length: 4,
                    disabledPinTheme: defaultPinTheme.copyWith(
                      textStyle: AppTextStyles.heeboHeading,
                    ),
                    followingPinTheme: defaultPinTheme.copyWith(
                      textStyle: AppTextStyles.heeboHeading,
                    ),
                    defaultPinTheme: defaultPinTheme.copyWith(
                      textStyle: AppTextStyles.heeboHeading,
                    ),
                    focusedPinTheme: defaultPinTheme.copyWith(
                      textStyle: AppTextStyles.heeboHeading,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: AppColors.primary400, width: 2),
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme,
                    showCursor: true,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraOverLarge,
                  ),
                  Text(
                    "00:60 Sec",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.heading7
                        .copyWith(color: AppColors.neutral60),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeLarge,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppTexts.didntRecieveCode,
                          style: AppTextStyles.heading7
                              .copyWith(color: AppColors.neutral60),
                        ),
                        TextSpan(
                            text: AppTexts.resend,
                            style: AppTextStyles.heading7.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.alertGreen)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSizeExtraOverLarge,
                  ),
                  GetBuilder<AuthController>(builder: (authController) {
                    return CustomButton(
                      isLoading: authController.isLoading,
                      backgroundColor: AppColors.primary400,
                      title: AppTexts.submit,
                      onTap: () {
                        verifyOtp();
                      },
                    );
                  })
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  verifyOtp() {
    if (pinputController.text.trim().length < 4) {
      showCustomSnackbar(AppTexts.enterOtp);
    } else if (pinputController.text.trim() !=
        Get.find<AuthController>().otpModel?.otp) {
      showCustomSnackbar(AppTexts.invalidOtp);
    } else {
      if (Get.find<AuthController>().otpModel?.user ?? false) {
        Get.offAllNamed(Routes.dashboard);
      } else {
        Get.toNamed(Routes.enterName);
      }
    }
  }
}
