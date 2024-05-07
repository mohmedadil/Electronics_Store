part of 'getfavourite_cubit.dart';

@immutable
sealed class GetfavouriteState {}

final class GetfavouriteInitial extends GetfavouriteState {}
final class GetfavouriteSuccess extends GetfavouriteState {}
