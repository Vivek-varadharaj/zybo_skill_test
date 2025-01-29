import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(BannerChangedState(index: 0)) {
    on<BannerChangeEvent>((event, emit) {
      emit(BannerChangedState(index: event.index));
    });
  }
}
