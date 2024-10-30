import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/singel_articels.dart';

import 'package:techblog/service/api-provider.dart';

class SingelArticelsController extends GetxController {
  RxInt postIdContoreler = RxInt(0);
  Rx<SingelArticelsModel> singelArticel = SingelArticelsModel().obs;
  RxList<ArticleModel> related = RxList();
  getsingelArticel() async {
    singelArticel = SingelArticelsModel()
        .obs; //this line clean data model in singelarticels that already initialaze
    var id = "";
    var response = await ApiProvider().getMethod(ApiUrlConstant.baseUrl +
        'article/get.php?command=info&id= $postIdContoreler&user_id=$id');

    if (response.statusCode == 200) {
//TODO clearthis
      singelArticel.value = SingelArticelsModel.fromjson(response.data);
      response.data["related"].forEach((element) {
        related.add(ArticleModel.fromJson(element));
      });
      // print(response.data.toString());
    }
  }
}
