import 'dart:developer';

import 'package:dio/dio.dart' as dio_servis;
import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApiProvider {
  Dio _dio = Dio();

  //getMethod
  Future<dynamic> getMethod(String url) async {
    try {
      var res = await _dio.get(url,
          options: Options(
              contentType: "application/json",
              responseType: ResponseType.json,
              method: 'GET'));
      return res;
    } on DioException catch (err) {
         log('Error: ${err.response}');
      err.response;
    }
  }

  //postMethod
  Future<dynamic> postmethod(Map<String, dynamic> map, String url) async {
    try {
      var res = await _dio.post(url, data: dio_servis.FormData.fromMap(map));

      return res.data;
    } on DioException catch (err) {
         log('Error: ${err.response}');
      return err.response;
    }
  }
}
