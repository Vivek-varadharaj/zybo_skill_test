import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zybo_skill_test/common/widgets/custom_svg_image.dart';
import 'package:zybo_skill_test/features/auth/controllers/auth_controller.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/home/screens/home_screen.dart';
import 'package:zybo_skill_test/features/profile/controllers/profile_controller.dart';
import 'package:zybo_skill_test/features/profile/screens/profile_screen.dart';
import 'package:zybo_skill_test/features/wishlist/controller/wishlist_controller.dart';
import 'package:zybo_skill_test/features/wishlist/screens/wishlist_screen.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';
import 'package:zybo_skill_test/util/images.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    getDashboardData();
  }

  getDashboardData() {
    Get.find<HomeController>().getHomePageData();
    Get.find<ProfileController>().getProfile();
    Get.find<WishlistController>().getWishlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: _selectedIndex == 0
                ? const HomeScreen()
                : _selectedIndex == 1
                    ? const WishlistScreen()
                    : const ProfileScreen()),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusInfinity),
          color: AppColors.neutral0,
          boxShadow: const [
            BoxShadow(
              color: Color(0x26747474),
              offset: Offset(0, 4),
              blurRadius: 25,
              spreadRadius: 0,
            ),
          ],
        ),
        margin: const EdgeInsets.all(20),
        child: GNav(tabs: [
          GButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 0;
              });
            },
            icon: Icons.abc,
            backgroundColor: AppColors.primary400,
            leading: CustomSvgImage(
              width: 24,
              height: 24,
              assetPath: Images.home,
              color: _selectedIndex == 0
                  ? AppColors.neutral0
                  : AppColors.neutral60,
            ),
            text: '  ${AppTexts.home}',
            textStyle: AppTextStyles.latoPara.copyWith(
                color: AppColors.neutral0, fontWeight: FontWeight.w600),
          ),
          GButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 1;
              });
            },
            backgroundColor: AppColors.primary400,
            icon: Icons.favorite,
            text: '  ${AppTexts.wishList}',
            leading: CustomSvgImage(
              width: 24,
              height: 24,
              assetPath: Images.heart,
              color: _selectedIndex == 1
                  ? AppColors.neutral0
                  : AppColors.neutral60,
            ),
            textStyle: AppTextStyles.latoPara.copyWith(
                color: AppColors.neutral0, fontWeight: FontWeight.w600),
          ),
          GButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
            },
            backgroundColor: AppColors.primary400,
            icon: Icons.people,
            text: '  ${AppTexts.profile}',
            textStyle: AppTextStyles.latoPara.copyWith(
                color: AppColors.neutral0, fontWeight: FontWeight.w600),
            leading: CustomSvgImage(
              width: 24,
              height: 24,
              assetPath: Images.profile,
              color: _selectedIndex == 2
                  ? AppColors.neutral0
                  : AppColors.neutral60,
            ),
          ),
        ]),
      ),
    );
  }
}
