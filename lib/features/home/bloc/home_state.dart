part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeStateLoading extends HomeState {}

final class HomeStateError extends HomeState {
  final String message;

  HomeStateError({required this.message});
}

final class HomeBannerChanged extends HomeState {
  final int index;

  HomeBannerChanged({required this.index});
}

final class HomeStateLoaded extends HomeState {
  final List<ProductModel> popularProducts;
  final List<BannerModel> bannerList;

  HomeStateLoaded({required this.popularProducts, required this.bannerList});
}
