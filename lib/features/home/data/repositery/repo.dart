import 'package:shoes_store/features/home/data/model/model.dart';
import 'package:shoes_store/features/home/data/webservices/api_services.dart';

class Repositery {
  ApiServices apiServices = ApiServices();

  Future<List<ShoesModel>> getShoes(String endpoint) async {
    var response = await apiServices.getShoes(endpoint);
    List<ShoesModel> list = [];
    for (var element in response['data']) {
      list.add(ShoesModel.fromjson(element));
    }
    print(list.length);
    return list;
  }
}
