import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_image.dart';
import 'package:zybo_skill_test/features/home/bloc/banner_bloc.dart';
import 'package:zybo_skill_test/features/home/bloc/home_bloc.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/home/domain/models/banner_model.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key, required this.banners});
  final List<BannerModel> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 335 / 138,
              autoPlay: true,
              enlargeCenterPage: true,
              disableCenter: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 7),
              onPageChanged: (index, reason) {
                context.read<BannerBloc>().add(BannerChangeEvent(index: index));
              },
            ),
            itemCount: banners.length,
            itemBuilder: (context, index, _) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                child: CustomImage(
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width - 40,
                    image: banners[index].image),
              );
            }),
        SizedBox(
          height: Dimensions.paddingSizeDefault,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.map((bnr) {
            int index = banners.indexOf(bnr);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: BlocBuilder<BannerBloc, BannerState>(
                builder: (context, state) {
                  return Container(
                    height: 6,
                    width: index != state.index ? 6 : 20,
                    decoration: BoxDecoration(
                        color: index != state.index
                            ? AppColors.neutral90.withOpacity(0.2)
                            : AppColors.neutral90,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radiusDefault)),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
