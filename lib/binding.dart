import 'package:get/get.dart';
import 'package:techblog/controller/articels-list-controller.dart';
import 'package:techblog/controller/home-screen-controller.dart';
import 'package:techblog/controller/register-controller.dart';
import 'package:techblog/controller/singel_articels_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}

class ArticelsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ArticelsListController());
    Get.lazyPut(() => SingelArticelsController());
  }
}
class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeSreenController());
     
  }
}
