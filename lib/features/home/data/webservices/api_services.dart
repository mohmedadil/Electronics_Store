import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();
  final base = 'https://fakestoreapi.in/api/products/';
  Future<Map<String, dynamic>> getItem(String endpoint) async {
    try {
      Response response = await dio.get(base);
      print('get success');
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
