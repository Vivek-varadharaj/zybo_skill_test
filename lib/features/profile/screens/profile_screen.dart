import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';
import 'package:zybo_skill_test/features/profile/controllers/profile_controller.dart';
import 'package:zybo_skill_test/features/profile/widgets/profile_tile.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                ProfileTile(
                    heading: AppTexts.name,
                    subheading: profileController.profileModel?.name ?? ""),
                SizedBox(
                  height: Dimensions.paddingSizeExtraLarge,
                ),
                ProfileTile(
                    heading: AppTexts.phone,
                    subheading:
                        profileController.profileModel?.phoneNumber ?? ""),
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
