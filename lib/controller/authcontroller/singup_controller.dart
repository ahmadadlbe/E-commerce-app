import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/data/datasource/remote/auth/signupdata.dart';

abstract class SingUpController extends GetxController {
  singup();
  gotologin() {}
}

class SingUpControllerImp extends SingUpController {
  GlobalKey<FormState> formkey = GlobalKey();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  bool ishiad = true;
  SignUpData signUpData = SignUpData(Get.find());

  @override
  singup() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respon = await signUpData.postsignupdata(
          username: username.text,
          useremail: email.text,
          userpassword: password.text,
          userphon: phone.text);

      statusRequest = handlingData(respon);
      print(respon);
      if (statusRequest == StatusRequest.success) {
        print("object");
        if (respon['status'] == "success") {
          // data.addAll(respon['data']);
          Get.offAllNamed(AppRoutes.verifyCodesignuproutes,
              arguments: {"useremail": email.text});
        } else if (respon['status'] == "failure") {
          Get.defaultDialog(title: "53".tr, middleText: "57".tr);
        }
      } else if (statusRequest == StatusRequest.serverfailur) {
        Get.defaultDialog(title: "53".tr, middleText: "81".tr);
      }
    }
    update();
  }

  showandhiadpass() {
    ishiad = ishiad == true ? false : true;
    update();
  }

  @override
  gotologin() {
    Get.toNamed(AppRoutes.loginroutes);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }
}
