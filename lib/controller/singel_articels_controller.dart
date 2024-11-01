import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/singel_articels.dart';
import 'package:techblog/models/tags.model.dart';

import 'package:techblog/service/api-provider.dart';

class SingelArticelsController extends GetxController {
  RxInt postIdContoreler = RxInt(0);
  Rx<SingelArticelsModel> singelArticel = SingelArticelsModel().obs;
  RxList<ArticleModel> related = RxList();
  RxList<TagsModel> tagslist = RxList();

  getsingelArticel() async {
    singelArticel = SingelArticelsModel()
        .obs; //this line clean data model in singelarticels that already initialaze
    var id = "";
    var response = await ApiProvider().getMethod(
        '${ApiUrlConstant.baseUrl}article/get.php?command=info&id= $postIdContoreler&user_id=$id');

    if (response.statusCode == 200) {
//TODO clearthis
      singelArticel.value = SingelArticelsModel.fromjson(response.data);
      //get related List post
      related.clear();
      response.data["related"].forEach((element) {
        related.add(ArticleModel.fromJson(element));
      });
      response.data["tags"].forEach((elment) {
        tagslist.add(TagsModel.fromjson(elment));
      });
      // print(response.data.toString());
    }
  }
}
