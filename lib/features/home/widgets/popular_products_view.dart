import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/common/widgets/product_card.dart';
import 'package:zybo_skill_test/features/home/bloc/home_bloc.dart';
import 'package:zybo_skill_test/util/app_text_styles.dart';
import 'package:zybo_skill_test/util/app_texts.dart';
import 'package:zybo_skill_test/util/dimensions.dart';

class PopularProductsView extends StatelessWidget {
  const PopularProductsView({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state is HomeStateLoaded
            ? Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Dimensions.paddingSizeExtraLarge,
                      ),
                      Text(
                        AppTexts.popularProduct,
                        style: AppTextStyles.heeboHeading,
                      ),
                      SizedBox(
                        height: Dimensions.paddingSizeDefault,
                      ),
                      GridView.count(
                        mainAxisSpacing: 32,
                        crossAxisSpacing: 16,
                        physics: const ClampingScrollPhysics(),
                        childAspectRatio: 163 / 232,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: state.popularProducts
                            .map(
                                (product) => ProductCard(productModel: product))
                            .toList(),
                      )
                    ],
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
