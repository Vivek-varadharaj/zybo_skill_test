import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zybo_skill_test/common/widgets/custom_svg_image.dart';
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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
    ),
    Text(
      'Likes',
    ),
    Text(
      'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
        child: SafeArea(
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
                assetPath: Images.home,
                color: _selectedIndex == 0
                    ? AppColors.neutral0
                    : AppColors.neutral60,
              ),
              text: '  ${AppTexts.home}',
              textStyle:
                  AppTextStyles.latoPara.copyWith(color: AppColors.neutral0),
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
                assetPath: Images.heart,
                color: _selectedIndex == 1
                    ? AppColors.neutral0
                    : AppColors.neutral60,
              ),
              textStyle:
                  AppTextStyles.latoPara.copyWith(color: AppColors.neutral0),
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
              textStyle:
                  AppTextStyles.latoPara.copyWith(color: AppColors.neutral0),
              leading: CustomSvgImage(
                assetPath: Images.profile,
                color: _selectedIndex == 2
                    ? AppColors.neutral0
                    : AppColors.neutral60,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
