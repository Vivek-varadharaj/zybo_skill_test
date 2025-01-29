import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/features/home/domain/models/banner_model.dart';
import 'package:zybo_skill_test/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeDataRequested>((event, emit) async {
      emit(HomeStateLoading());
      try {
        List<ProductModel>? products = await homeRepository.getProductList();
        List<BannerModel>? banners = await homeRepository.getBannerList();
        emit(HomeStateLoaded(
            popularProducts: products ?? [], bannerList: banners ?? []));
      } catch (e) {
        emit(HomeStateError(message: e.toString()));
      }
    });
  }
}
