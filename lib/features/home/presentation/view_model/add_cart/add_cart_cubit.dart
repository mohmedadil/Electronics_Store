import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'add_cart_state.dart';

class AddCartCubit extends Cubit<AddCartState> {
  AddCartCubit() : super(AddCartInitial());

  addToCart(ItemModel item) async {
    try {
      emit(AddCartLoading());
      var cart = Hive.box<ItemModel>('cartbox');
      await cart.add(item);
      print(cart.length);
      emit(AddCartSuccess());
    } catch (e) {
      emit(AddCartFailure(message: e.toString()));
    }
  }
}
