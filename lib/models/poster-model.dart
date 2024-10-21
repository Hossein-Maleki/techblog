// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:techblog/constans/api_constant.dart';

class posterModel {
  String? id;
  String? title;
  String? poster;
  
  posterModel({
    required this.id,
    required this.title,
    required this.poster,
   
  });


  factory posterModel.fromJson(Map<String, dynamic> json) {
    return posterModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      poster: ApiUrlConstant.hostDlUrl + (json['poster'] ?? ''),
  
    );

  }
}