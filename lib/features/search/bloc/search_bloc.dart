import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:zybo_skill_test/common/models/product_model.dart';
import 'package:zybo_skill_test/features/search/domain/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc(this.searchRepository) : super(SearchInitial()) {
    on<SearchingWithQuery>((event, emit) async {
      emit(SearchLoading());
      List<ProductModel> searchedProducts =
          await searchRepository.searchProducts(event.query);

      emit(SearchLoaded(products: searchedProducts));
    });
  }
}
