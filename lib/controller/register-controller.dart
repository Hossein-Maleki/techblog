import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/service/api-provider.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController verfyCode = TextEditingController();
  var email;
  var userid = "";

  register() async {
    Map<String, dynamic> map = {
      'email': emailController.text,
      "command": "register"
    };

    var res = ApiProvider().postmethod(map, ApiUrlConstant.postRegister);
    
    email = emailController.text;
   
    print(res);
  }


verify() async {
    Map<String, dynamic> map = {
      'email': email,
      "command": "verify"
    };

    var a = ApiProvider().postmethod(map, ApiUrlConstant.postRegister);
    print(a);
  }
}
