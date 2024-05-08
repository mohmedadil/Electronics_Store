import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'getcart_state.dart';

class GetcartCubit extends Cubit<GetcartState> {
  GetcartCubit() : super(GetcartInitial());
  late List<ItemModel> item;
  int count = 0;
  getCart() {
    var cart = Hive.box<ItemModel>('cartbox');
    item = cart.values.toList();

    count = 0;

    for (var element in item) {
      int x = element.price as int;

      count += x;
    }

    emit(GetcartSuccess(items: item));
  }

  add(int x) {
    count = count + x;
  }

  void refresh() {
    emit(GetcartSuccess(items: item));
  }
}
