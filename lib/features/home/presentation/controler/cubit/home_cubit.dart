import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int page = 0;
  bool isSelected = false;
  void getpage(int value) {
    page = value;
    emit(HomeSuccess());
  }

  void restart() {
    emit(HomeSuccess());
  }
}
