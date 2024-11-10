import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/constans/api_constant.dart';
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
        Get.offAndToNamed( MyAppScren.mainScreen);
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
    if (GetStorage().read("token") == null) {
      Get.to(ArticelsIntroScreen());
    } else {
      Get.snackbar("title", "قبلا ثبت نام شدید");
      print("post screen");
    }
  }
}
