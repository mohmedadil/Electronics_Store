part of 'addfavourite_cubit.dart';

@immutable
sealed class AddfavouriteState {}

final class AddfavouriteInitial extends AddfavouriteState {}

final class AddfavouriteLoading extends AddfavouriteState {}

final class AddfavouriteSuccess extends AddfavouriteState {}

final class AddfavouriteFaluire extends AddfavouriteState {
  final String message;

  AddfavouriteFaluire({required this.message});
}
