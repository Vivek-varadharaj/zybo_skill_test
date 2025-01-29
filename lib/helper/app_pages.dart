import 'package:get/get.dart';
import 'package:zybo_skill_test/features/auth/screens/enter_name_screen.dart';
import 'package:zybo_skill_test/features/auth/screens/login_screen.dart';
import 'package:zybo_skill_test/features/auth/screens/otp_verification_screen.dart';
import 'package:zybo_skill_test/features/dashboard/screens/dashboard_screen.dart';
import 'package:zybo_skill_test/features/home/screens/home_screen.dart';
import 'package:zybo_skill_test/features/profile/screens/profile_screen.dart';
import 'package:zybo_skill_test/features/search/screens/search_screen.dart';
import 'package:zybo_skill_test/features/splash/screens/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.dashboard,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: Routes.enterName,
      page: () => const EnterNameScreen(),
    ),
    GetPage(
      name: Routes.verifyOtp,
      page: () => const OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchScreen(),
    ),
  ];
}
