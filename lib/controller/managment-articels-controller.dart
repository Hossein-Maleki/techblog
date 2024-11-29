import 'package:flutter/widgets.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags.model.dart';
import 'package:techblog/service/api-provider.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  RxBool isloading = true.obs;

  @override
  onInit() {
    super.onInit();
    getManagedArticle();
  }

  getManagedArticle() async {
     
    // ignore: todo
    //TODO get userid from getStorage ApiConstant.getArticleList+userid
    // var response = await DioService().getMethod(ApiConstant.publishedByMe+GetStorage().read(StorageKey.userId));
    var response =
        await ApiProvider().getMethod(ApiUrlConstant.publishedByMe + "1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
              isloading.value = false;
      });
      //   articleList.clear();

    }
  }
}
