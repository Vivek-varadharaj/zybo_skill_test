part of 'banner_bloc.dart';

@immutable
sealed class BannerEvent {}

class BannerChangeEvent extends BannerEvent {
  final int index;

  BannerChangeEvent({required this.index});
}
