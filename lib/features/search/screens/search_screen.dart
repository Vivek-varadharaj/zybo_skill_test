import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get/get.dart';
import 'package:zybo_skill_test/common/widgets/custom_back_button.dart';
import 'package:zybo_skill_test/common/widgets/product_card.dart';
import 'package:zybo_skill_test/features/home/controllers/home_controller.dart';
import 'package:zybo_skill_test/features/home/widgets/home_text_field.dart';
import 'package:zybo_skill_test/features/search/bloc/search_bloc.dart';
import 'package:zybo_skill_test/features/search/controllers/search_controller.dart';
import 'package:zybo_skill_test/util/app_colors.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchingWithQuery(query: ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(
                    width: Dimensions.paddingSizeDefault,
                  ),
                  Expanded(child: HomeTextField(isEnabled: true)),
                ],
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return state is SearchLoading
                      ? const Expanded(
                          child: Center(
                              child: CircularProgressIndicator(
                          color: AppColors.primary400,
                        )))
                      : state is SearchLoaded
                          ? Expanded(
                              child: (state.products.isEmpty)
                                  ? Center(
                                      child: Text(
                                        "No products found",
                                        style: AppTextStyles.heading3.copyWith(
                                            color: AppColors.primary400),
                                      ),
                                    )
                                  : GridView.count(
                                      padding: EdgeInsets.zero,
                                      mainAxisSpacing: 32,
                                      crossAxisSpacing: 16,
                                      physics: const ClampingScrollPhysics(),
                                      childAspectRatio: 163 / 232,
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      children: state.products
                                          .map((product) => ProductCard(
                                              productModel: product))
                                          .toList(),
                                    ),
                            )
                          : const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
