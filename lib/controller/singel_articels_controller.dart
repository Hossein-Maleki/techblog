import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/models/singel_articels.dart';

import 'package:techblog/service/api-provider.dart';

class SingelArticelsController extends GetxController {
  RxInt postIdContoreler = RxInt(0);
  Rx<SingelArticelsModel> singelArticel = SingelArticelsModel().obs;

 
  getsingelArticel() async {
    var id = "";
    var response = await ApiProvider().getMethod(ApiUrlConstant.baseUrl +
        'article/get.php?command=info&id= $postIdContoreler&user_id=$id');

    if (response.statusCode == 200) {
//TODO clearthis
      singelArticel.value = SingelArticelsModel.fromjson(response.data);
      print(response.data.toString());
    }
  }
}
