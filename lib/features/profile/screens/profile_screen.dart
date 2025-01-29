import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';
import 'package:zybo_skill_test/features/profile/controllers/profile_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: GetBuilder<ProfileController>(builder: (profileController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.paddingSizeDefault,
                ),
                Text(
                  AppTexts.myProfile,
                  style: AppTextStyles.heeboHeading
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraOverLarge,
                ),
                Text(
                  AppTexts.name,
                  style: AppTextStyles.heading7.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.neutral60),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                Text(
                  profileController.profileModel?.name ?? "",
                  style: AppTextStyles.heading3
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeExtraLarge,
                ),
                Text(
                  AppTexts.phone,
                  style: AppTextStyles.heading7.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.neutral60),
                ),
                SizedBox(
                  height: Dimensions.paddingSizeSmall,
                ),
                Text(
                  profileController.profileModel?.phoneNumber ?? "",
                  style: AppTextStyles.heading3
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: (Dimensions.paddingSizeExtraOverLarge),
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Get.find<AuthController>().logout();
                      },
                      child: Text(
                        AppTexts.logout,
                        style: AppTextStyles.button
                            .copyWith(color: AppColors.primary400),
                      )),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
