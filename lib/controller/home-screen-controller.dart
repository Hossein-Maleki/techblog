import 'dart:math';

import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';

import 'package:techblog/service/api-provider.dart';

class HomeSreenController extends GetxController {
  late Rx posterModel;
  RxList<ArticleModel> topArticelsList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();

  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await ApiProvider().getMethod(ApiUrlConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data["top_visited"].forEach((element) {
        topArticelsList.add(ArticleModel.fromJson(element));
      });
      response.data["top_podcasts"].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });
     print(response.data["top_podcasts"]);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
