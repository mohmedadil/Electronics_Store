import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/features/home/data/repositery/repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int page = 0;
  late List<ItemModel> item;
  bool isSelected = false;
  UserCredential? user;
  var repo = Repositery();
  Future<void> getItem() async {
    try {
      emit(HomeLoading());
      item = await repo.getItem();
      emit(HomeSuccess(item: item));
    } catch (e) {
      print(e.toString());
      emit(HomeFaluire());
    }
  }

  Future<void> getCategoryItem(String category) async {
    try {
      emit(HomeLoading());
      item = await repo.getCategoryItems(category);
      emit(HomeSuccess(item: item));
    } catch (e) {
      print(e.toString());
      emit(HomeFaluire());
    }
  }
}
