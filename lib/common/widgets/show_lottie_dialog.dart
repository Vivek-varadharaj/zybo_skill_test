import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:zybo_skill_test/util/images.dart';

void showLottieDialog() {
  Get.dialog(
    Dialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Center(
        child: Lottie.asset(
          Images.addToFavorite,
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
    ),
    barrierColor: Colors.black54,
    barrierDismissible: false,
  );

  Future.delayed(const Duration(milliseconds: 1500), () {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  });
}
