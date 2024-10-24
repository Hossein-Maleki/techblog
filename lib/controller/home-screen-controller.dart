import 'dart:math';

import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster-model.dart';
import 'package:techblog/models/tags.model.dart';

import 'package:techblog/service/api-provider.dart';

class HomeSreenController extends GetxController {
  late Rx<PosterModel> postermodel = PosterModel().obs;
  RxList<ArticleModel> topArticelsList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  RxList<TagsModel> tagsList = RxList();
  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await ApiProvider().getMethod(ApiUrlConstant.getHomeItems);

    if (response.statusCode == 200) {
      isLoading.value = true;
      response.data["top_visited"].forEach((element) {
        topArticelsList.add(ArticleModel.fromJson(element));
      });
      response.data["top_podcasts"].forEach((element) {
        topPodcastList.add(PodcastModel.fromJson(element));
      });
      response.data["tags"].forEach((elemet) {
        tagsList.add(TagsModel.fromjson(elemet));
      });

      postermodel.value = PosterModel.fromJson(response.data["poster"]);
      log(response.data["poster"]).toString();
    } else {
      
    }
  }
}
