import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/data/datasource/remote/auth/forgetpassword/resetpassworddata.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formkey = GlobalKey();
  late TextEditingController password;
  late TextEditingController repassword;
  bool ishiad = true;
  StatusRequest statusRequest = StatusRequest.none;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  String? email;
  @override
  resetpassword() async {
    if (repassword.text != password.text) {
      return Get.defaultDialog(title: "53".tr, middleText: "60".tr);
    } else {
      if (formkey.currentState!.validate()) {
        statusRequest = StatusRequest.loading;
        update();
        var respon = await resetPasswordData.postResetPasswordData(
          useremail: email!,
          userpassword: password.text,
        );
        statusRequest = handlingData(respon);
        if (statusRequest == StatusRequest.success) {
          if (respon['status'] == "success") {
            Get.toNamed(
              AppRoutes.succsesPasswordroutes,
            );
          } else if (respon['status'] == "failure") {
            Get.defaultDialog(title: "62".tr, middleText: "61".tr);
          }
        }
      }
    }
    update();
  }

  showandhiadpass() {
    ishiad = ishiad == true ? false : true;
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    email = Get.arguments['useremail'];

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
