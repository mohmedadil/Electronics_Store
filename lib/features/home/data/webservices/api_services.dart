import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();
  final base = 'https://fakestoreapi.in/api/products/';
  Future<Map<String, dynamic>> getItem() async {
    try {
      Response response = await dio.get(base);
      print('get success');
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
    Future<Map<String, dynamic>> getCategoryItem(String category) async {
    try {
      Response response = await dio.get(base+'/category?type=$category');
      print('get success');
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
