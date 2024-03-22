import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int page=0;
  void getpage(int value) {
    page = value;
    emit(HomeSuccess());
  }
}
