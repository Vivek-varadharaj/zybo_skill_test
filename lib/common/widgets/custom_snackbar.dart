import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/util/app_colors.dart';

void showCustomSnackbar(String title) {
  Get.snackbar(
    title,
    '',
    messageText: const SizedBox(),
    backgroundColor:
        AppColors.primary400, // Assuming primary400 is defined here
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(16),
    borderRadius: 8,
  );
}
