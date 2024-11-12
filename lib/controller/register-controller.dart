import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:techblog/service/api-provider.dart';
import 'package:techblog/view/articels_screen/articels_intro.dart';
import 'package:techblog/view/main_screen/main_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController verifyCode = TextEditingController(); // نام اصلاح شده

  var email = ""; // برای ذخیره ایمیل برای استفاده در صفحه بعدی
  var userid = "";

  register() async {
    if (emailController.text.isEmpty) {
      Get.snackbar("خطا", "ایمیل نمی‌تواند خالی باشد");
      return;
    }

    // درخواست مدل نقشه
    Map<String, dynamic> map = {
      'email': emailController.text,
      "command": "register"
    };

    var res = await ApiProvider().postmethod(map, ApiUrlConstant.postRegister);

    if (res != null && res.containsKey("user_id")) {
      email = emailController.text; // ذخیره ایمیل در متغیر محلی
      userid = res["user_id"];
    } else {
      Get.snackbar("خطا", "مشکلی در ثبت‌نام رخ داده است");
      return;
    }

    print(res.toString());
  }

  verify() async {
    if (verifyCode.text.isEmpty) {
      Get.snackbar("خطا", "کد تأیید نمی‌تواند خالی باشد");
    }

    // درخواست مدل نقشه
    Map<String, dynamic> map = {
      'email': email,
      "user_id": userid,
      "code": verifyCode.text,
      "command": "verify"
    };

    var resp = await ApiProvider().postmethod(map, ApiUrlConstant.postRegister);

    if (resp == null) {
      Get.snackbar("خطا", "پاسخ نامعتبر از سرور");
      return;
    }

    print(resp.toString());
    var status = resp["response"];
    switch (status) {
      case "verified":
        final box = GetStorage();
        box.write("user_id", resp["user_id"]);
        box.write("token", resp["token"]);
        Get.offAndToNamed(MyAppScren.mainScreen);
        Get.snackbar(
            backgroundColor: Colors.green,
            colorText: Colors.black87,
            "title",
            "خوش آمدید");
        break;
      case "incorrect_code":
        Get.snackbar("خطا", "کد وارد شده نادرست است");
        break;
      case "expired":
        Get.snackbar("خطا", "کد منقضی شده است");
        break;
      default:
        Get.snackbar("خطا", "وضعیت نامشخص");
    }
  }

  statuslogin() {
    if (GetStorage().read("token") == 0) {
      Get.to(ArticelsIntroScreen());
    } else {
      genMangmentaBottomshit();
    }
  }

  Future genMangmentaBottomshit() {
    var theme = Theme.of(Get.context!);
    return Get.bottomSheet(Container(
      height: Get.height / 2.7,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
          color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  alignment: Alignment.center,
                  Assets.images.tcbot,
                  width: 54,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  MyStrings.shareKnowledge,
                  style: theme.textTheme.titleMedium,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28,left: 24 ),
            child: Text(
              MyStrings.gigTech,
              
              style: theme.textTheme.labelMedium,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () =>Get.toNamed( MyAppScren.managmentArticels ) ,
                child: Row(
                  children: [
                    Assets.icons.writePodcastIcon.image(
                      width: 42,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(MyStrings.ManagePodcast)
                  ],
                ),
              ),
              Row(
                children: [
                  Assets.icons.writeArticle.image(width: 42),
                  SizedBox(
                    width: 6,
                  ),
                  Text(MyStrings.titleAppBarManageArticle)
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
