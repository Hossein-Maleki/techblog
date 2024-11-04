import 'package:dio/dio.dart' as dio_servis   ;
import 'package:dio/dio.dart';

class ApiProvider {
  Dio _dio = Dio();

  //getMethod
  Future<dynamic> getMethod(String url) async {
    var res = await _dio.get(url,
        options: Options(
            contentType: "application/json",
            responseType: ResponseType.json,
            method: 'GET'));
    return res;
  }

  //postMethod
  Future<dynamic> postmethod(Map<String, dynamic> map, String url) async {
    var res = await _dio.post(url, data:dio_servis.FormData.fromMap(map) );

    return res.data;
  }
}
