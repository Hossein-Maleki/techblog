import 'package:dio/dio.dart';

class ApiProvider {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();

    var res = await dio.get(url,
        options: Options(
            contentType: "application/json",
            responseType: ResponseType.json,
            method: 'GET'));
    return res;
  }
}

 