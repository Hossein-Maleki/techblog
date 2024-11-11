import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/service/api-provider.dart';
import 'package:techblog/view/articels_screen/articels_list.dart';
import 'package:techblog/view/articels_screen/singel_articels.dart';

class ArticelsListController extends GetxController {
  RxList<ArticleModel> ArticelsList = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

//1
  getHomeItems() async {
    var response = await ApiProvider().getMethod(ApiUrlConstant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        ArticelsList.add(ArticleModel.fromJson(element));
      });
    }
  }

//2
  getArticelsListWithId(id) async {
    ArticelsList.clear();
    var response = await ApiProvider().getMethod(
        "${ApiUrlConstant.baseUrl}article/get.php?command=get_articles_with_cat_id&cat_id=$id&user_id=1");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        ArticelsList.add(ArticleModel.fromJson(element));
        Get.to(ArticelsListScreen(appbarTitle: "   مقالات مرتبط",));
      });
    }
  }
}
