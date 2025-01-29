import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:zybo_skill_test/features/home/bloc/home_bloc.dart';

import 'package:zybo_skill_test/features/home/widgets/banner_view.dart';
import 'package:zybo_skill_test/features/home/widgets/home_text_field.dart';
import 'package:zybo_skill_test/features/home/widgets/popular_products_view.dart';
import 'package:zybo_skill_test/helper/app_pages.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, homeSate) {
      return Scaffold(
          body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
              child: homeSate is HomeStateLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary400,
                      ),
                    )
                  : homeSate is HomeStateLoaded
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.search);
                                },
                                child: const HomeTextField(
                                  isEnabled: false,
                                )),
                            Expanded(
                                child: ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              children: [
                                if (homeSate.bannerList.isNotEmpty)
                                  BannerView(banners: homeSate.bannerList),
                                if (homeSate.popularProducts.isNotEmpty)
                                  PopularProductsView(
                                      products: homeSate.popularProducts)
                              ],
                            ))
                          ],
                        )
                      : homeSate is HomeStateError
                          ? const Center(
                              child: Text(
                                "Something went wrong",
                              ),
                            )
                          : SizedBox()));
    });
  }
}
