part of 'search_cubit_cubit.dart';

@immutable
sealed class SearchCubitState {}

final class SearchCubitInitial extends SearchCubitState {}

final class SearchCubitSuccess extends SearchCubitState {
  final List<ItemModel> items;

  SearchCubitSuccess({required this.items});
}
