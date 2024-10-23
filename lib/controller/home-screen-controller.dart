import 'dart:math';

import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster-model.dart';

import 'package:techblog/service/api-provider.dart';

class HomeSreenController extends GetxController {
  late Rx<PosterModel> postermodel = PosterModel().obs;
  RxList<ArticleModel> topArticelsList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxBool isLoading = false.obs;

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
      postermodel.value = response.data["poster"].forEach((element) {
        PosterModel.fromJson(element);
      });
      isLoading.value = true;
      log(response.data["poster"]);
    } else {
      print('Error: ${response.statusCode}');
    }
  }
}
