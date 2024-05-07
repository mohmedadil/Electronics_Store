import 'package:Electronic_Store/core/model/shoes_model.dart';
import 'package:Electronic_Store/features/home/data/webservices/api_services.dart';

class Repositery {
  ApiServices apiServices = ApiServices();

  Future<List<ItemModel>> getItem( ) async {
    var response = await apiServices.getItem();
    List<ItemModel> list = [];
    for (var element in response['products']) {
      list.add(ItemModel.fromjson(element));
    }
    print(list.length);
    return list;
  }
   Future<List<ItemModel>> getCategoryItems(String category)  async {
    var response = await apiServices.getCategoryItem(category);
    List<ItemModel> list = [];
    for (var element in response['products']) {
      list.add(ItemModel.fromjson(element));
    }
    print(list.length);
    return list;
  }
}
