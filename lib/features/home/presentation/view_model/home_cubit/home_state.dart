part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ItemModel> item;

  HomeSuccess({required this.item});
}

final class HomeFaluire extends HomeState {}
