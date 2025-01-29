part of 'banner_bloc.dart';

@immutable
sealed class BannerState {
  final int index;

  const BannerState({required this.index});
}

class BannerChangedState extends BannerState {
  BannerChangedState({super.index = 0});
}
