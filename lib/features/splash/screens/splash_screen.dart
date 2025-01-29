import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_svg_image.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';
import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/util/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    String? token = (Get.find<AuthController>().getIsUserLoggedIn());

    if (token != null) {
      await Get.find<AuthController>().saveUserToken(token);
      Get.offNamed(Routes.dashboard);
    } else {
      Get.toNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomSvgImage(assetPath: Images.logo),
      ),
    );
  }
}
