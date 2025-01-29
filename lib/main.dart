import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:zybo_skill_test/features/home/bloc/home_bloc.dart';
import 'package:zybo_skill_test/features/splash/screens/splash_screen.dart';
import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/helper/bloc_init.dart';
import 'package:zybo_skill_test/helper/get_di.dart';
import 'helper/get_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  final blocProviders = await initiate();
  runApp(MyApp(
    blocProviders: blocProviders,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.blocProviders});
  final List<BlocProvider> blocProviders;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      builder: (context, child) => MultiBlocProvider(
        providers: blocProviders,
        child: GetMaterialApp(
          getPages: AppPages.routes,
          initialRoute: AppPages.initial,
          title: 'Flutter Demo',
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
