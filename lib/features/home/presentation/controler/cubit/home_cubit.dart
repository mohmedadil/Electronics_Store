import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:shoes_store/core/model/shoes_model.dart';
import 'package:shoes_store/features/home/data/repositery/repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int page = 0;
  late List<ShoesModel> shoes;
  bool isSelected = false;
  UserCredential? user;
  var repo = Repositery();
  Future<void> getshoes(String endpoint) async {
    try {
      emit(HomeLoading());
      shoes = await repo.getShoes(endpoint);
      emit(HomeSuccess(shoes: shoes));
    } catch (e) {
      print(e.toString());
      emit(HomeFaluire());
    }
  }
}
