import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/features/splash/screens/splash_screen.dart';
import 'package:zybo_skill_test/helper/app_pages.dart';
import 'helper/get_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.circularReveal,
      debugShowCheckedModeBanner: false,
      transitionDuration: Duration(milliseconds: 350),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      title: 'Zybo Skill',
      home: const SplashScreen(),
    );
  }
}
