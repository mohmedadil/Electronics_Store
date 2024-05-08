import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';

part 'addfavourite_state.dart';

class AddfavouriteCubit extends Cubit<AddfavouriteState> {
  AddfavouriteCubit() : super(AddfavouriteInitial());

  addToFavourite(ItemModel shoes) async {
    try {
      emit(AddfavouriteLoading());
      var favouriteBox = Hive.box<ItemModel>('favouritebox');
      await favouriteBox.add(shoes);
      print(favouriteBox.length);
      emit(AddfavouriteSuccess());
    } catch (e) {
      emit(AddfavouriteFaluire(message: e.toString()));
    }
  }
}
