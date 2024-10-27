// ignore_for_file: non_constant_identifier_names

import 'package:techblog/constans/api_constant.dart';

class SingelArticelsModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  SingelArticelsModel({
 this.id,
    this.title,
    this.content,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
    this.isFavorite,
  });

  SingelArticelsModel.fromjson(Map<String, dynamic>json) {
    var info = json["info"];

    id = info["id"];
    title = info["title"];
    content = info["content"];
    image=  ApiUrlConstant.hostDlUrl +info["image"];
    catId = info["cat_id"];
    catName = info["cat_name"];
    author = info["author"];
    view = info["view"];
    status = info["status"];
    createdAt = info["created_at"];
    isFavorite = json["isFavorite"];
  }
}
