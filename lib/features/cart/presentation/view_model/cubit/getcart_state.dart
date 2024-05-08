part of 'getcart_cubit.dart';

@immutable
sealed class GetcartState {}

final class GetcartInitial extends GetcartState {}

final class GetcartSuccess extends GetcartState {
  final List<ItemModel> items;

  GetcartSuccess({required this.items});
}
