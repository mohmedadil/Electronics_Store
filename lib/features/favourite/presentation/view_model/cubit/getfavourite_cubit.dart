import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';

part 'getfavourite_state.dart';

class GetfavouriteCubit extends Cubit<GetfavouriteState> {
  GetfavouriteCubit() : super(GetfavouriteInitial());
  late List<ItemModel> shoes;
  List<ItemModel> getFavourite() {
    var FavouriteBox = Hive.box<ItemModel>('shoesbox');
    emit(GetfavouriteSuccess());

    return FavouriteBox.values.toList();
  }
}
