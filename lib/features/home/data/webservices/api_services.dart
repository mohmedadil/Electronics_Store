import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();
  final base = 'https://real-time-product-search.p.rapidapi.com/search?q=';
  Future<Map<String,dynamic>> getShoes(String endpoint) async {
    try {
      Map<String, String> headers = {
        'X-RapidAPI-Key': '14929afd06msh8a8aa54a1dac77fp133c28jsn2e030037cbc1',
        'X-RapidAPI-Host': 'real-time-product-search.p.rapidapi.com'
      };
      Response response =
          await dio.get(base+endpoint, options: Options(headers: headers));
      print('get success');
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
