import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zybo_skill_test/api/api_client.dart';
import 'package:zybo_skill_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:zybo_skill_test/features/home/bloc/banner_bloc.dart';
import 'package:zybo_skill_test/features/home/bloc/home_bloc.dart';
import 'package:zybo_skill_test/features/home/domain/repositories/home_repository.dart';
import 'package:zybo_skill_test/util/app_constants.dart';

Future<List<BlocProvider>> initiate() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final apiClient = ApiClient(
    appBaseUrl: AppConstants.appBaseUrl,
    sharedPreferences: sharedPreferences,
  );

  final homeRepository = HomeRepository(apiClient: apiClient);

  return [
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        homeRepository: homeRepository,
      ),
    ),
    BlocProvider<BannerBloc>(
      create: (context) => BannerBloc(),
    ),
  ];
}
