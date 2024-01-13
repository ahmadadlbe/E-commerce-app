import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/data/datasource/remote/auth/forgetpassword/checkemaildata.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formkey = GlobalKey();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  checkemail() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respon = await checkEmailData.postCheckemaildata(
        useremail: email.text,
      );

      statusRequest = handlingData(respon);

      if (statusRequest == StatusRequest.success) {
        if (respon['status'] == "success") {
          Get.offAllNamed(AppRoutes.verifyCoderoutes,
              arguments: {"useremail": email.text});
        } else if (respon['status'] == "failure") {
          Get.defaultDialog(title: "53".tr, middleText: "59".tr);
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
