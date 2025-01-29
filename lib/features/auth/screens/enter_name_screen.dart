import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:zybo_skill_test/common/models/response_model.dart';
import 'package:zybo_skill_test/common/widgets/custom_back_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_button.dart';
import 'package:zybo_skill_test/common/widgets/custom_text_field.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';
import 'package:zybo_skill_test/features/splash/screens/splash_screen.dart';
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
    // TODO: implement initState
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
            CustomButton(
              onTap: () async {
                ResponseModel responseModel =
                    await Get.find<AuthController>().registration({
                  "phone_number":
                      "${Get.find<AuthController>().selectedCountry.phoneCode}${Get.find<AuthController>().phoneNumber}",
                  "first_name": controller.text.trim()
                });

                if (responseModel.isSuccess) {
                  Get.toNamed(Routes.dashboard);
                }
              },
              title: AppTexts.submit,
            )
          ],
        ),
      )),
    );
  }
}
