part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchingWithQuery extends SearchEvent {
  final String query;

  SearchingWithQuery({required this.query});
}
