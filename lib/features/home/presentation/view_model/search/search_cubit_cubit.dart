import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_cubit_state.dart';

class SearchCubitCubit extends Cubit<SearchCubitState> {
  SearchCubitCubit() : super(SearchCubitInitial());
   List<ItemModel> searchingItems=[];
  ForSearch(String item, List<ItemModel> items) {
    searchingItems = items
        .where((element) => element.title!.toLowerCase().startsWith(item))
        .toList();
    emit(SearchCubitSuccess(items: searchingItems));
  }
}
