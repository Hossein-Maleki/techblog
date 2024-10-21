import 'package:dio/dio.dart';
class ApiProvider {
  

Future<dynamic> getMetod(String url) async {
  Dio dio = Dio();

  var data = await dio.get(url,
      options: Options(
          contentType: "application/json",
          responseType: ResponseType.json,
         method: 'GET')
          );  
  return data;
}
}