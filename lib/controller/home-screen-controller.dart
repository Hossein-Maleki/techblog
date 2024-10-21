import 'dart:math';

import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/fake_data/podcast-model.dart';
 
import 'package:techblog/service/api-provider.dart';

class HomeSreenController extends GetxController {
  late Rx posterModel;
  RxList<ArticleModel> topArticels = RxList();
  RxList<PodCastModel> topPodcast = RxList();

  getHomeItems() async {
    var respons = await ApiProvider().getMetod(ApiUrlConstant.getHomeItems);
    log(respons);
  }
}
