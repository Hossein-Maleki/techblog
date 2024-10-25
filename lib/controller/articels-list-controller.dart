import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/service/api-provider.dart';

class ArticelsListController extends GetxController {
  RxList<ArticleModel> ArticelsList = RxList();
 

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
   
    var response = await ApiProvider().getMethod(ApiUrlConstant.getArticleList);
 
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        ArticelsList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
