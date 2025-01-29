import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/common/widgets/custom_back_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_snackbar.dart';
import 'package:zybo_skill_test/common/widgets/custom_text_field.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';

import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({super.key});

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomBackButton(),
            SizedBox(
              height: Dimensions.paddingSizeExtraOverLarge,
            ),
            CustomTextField(
              controller: controller,
              hintText: AppTexts.enterName,
            ),
            SizedBox(
              height: Dimensions.paddingSizeExtraLarge,
            ),
            GetBuilder<AuthController>(builder: (authController) {
              return CustomButton(
                isLoading: authController.isLoading,
                onTap: () async {
                  register();
                },
                title: AppTexts.submit,
              );
            })
          ],
        ),
      )),
    );
  }

  register() async {
    if (controller.text.trim().length < 2) {
      return showCustomSnackbar(AppTexts.enterValidName);
    }
    ResponseModel responseModel =
        await Get.find<AuthController>().registration({
      "phone_number":
          "${Get.find<AuthController>().selectedCountry.phoneCode}${Get.find<AuthController>().phoneNumber}",
      "first_name": controller.text.trim()
    });

    if (responseModel.isSuccess) {
      Get.offAllNamed(
        Routes.dashboard,
      );
    } else {
      showCustomSnackbar(responseModel.message ?? AppTexts.registrationFailed);
    }
  }
}
