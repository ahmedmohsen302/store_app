import 'package:dio/dio.dart';

class Api {
  final dio = Dio();
  Future<dynamic> get({required String url}) async {
    Response response = await dio.get(url);
    List<dynamic> data = response.data;
    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(
        'there has been an error in statues code ${response.statusCode}',
      );
    }
  }
}
