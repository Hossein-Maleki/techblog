import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  // if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
  // } else {
  //   log("url not validated $url");
  // }
}

Future getUrl1(String url) async {
  Dio _dio = Dio();

  var data = await _dio.get(url,
      options: Options(
          contentType: "application/json",
          responseType: ResponseType.json,
          method: 'GET'));
  return data;
}

Future getUrl2(String url) async {
  Dio _dio = Dio();

  await _dio
      .get(url,
          options: Options(
              contentType: "application/json",
              responseType: ResponseType.json,
              method: 'GET'))
      .then((val) {
    return val;
  });
}
