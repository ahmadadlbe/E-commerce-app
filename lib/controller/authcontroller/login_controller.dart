import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/auth/logindata.dart';

abstract class LoginController extends GetxController {
  login();
  gotosingup();
  gotoforgetpassword();
  showandhiadpass();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formkey = GlobalKey();
  MyService myService = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  bool ishiad = true;
  StatusRequest statusRequest = StatusRequest.none;
  LogInData logInData = LogInData(Get.find());
  @override
  login() async {
    if (formkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var respon = await logInData.postlogindata(
        useremail: email.text,
        userpassword: password.text,
      );

      statusRequest = handlingData(respon);

      if (statusRequest == StatusRequest.success) {
        if (respon['status'] == "success") {
          if (respon['data']['users_approve'] == "1") {
            myService.sharPreferences
                .setString("userid", respon['data']['users_id']);
            myService.sharPreferences
                .setString("username", respon['data']['users_name']);
            myService.sharPreferences
                .setString("useremail", respon['data']['users_email']);
            myService.sharPreferences
                .setString("userpassword", respon['data']['users_password']);
            myService.sharPreferences
                .setString("userphon", respon['data']['users_phone']);
            myService.sharPreferences.setString("step", "2");
            String userid = myService.sharPreferences.getString("userid")!;
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");
            Get.offAllNamed(AppRoutes.homepageroutes);
          } else {
            Get.offAllNamed(AppRoutes.verifyCodesignuproutes,
                arguments: {"useremail": email.text});
          }
        } else if (respon['status'] == "failure") {
          Get.defaultDialog(title: "53".tr, middleText: "80".tr);
        }
      }
    }
    update();
  }

  @override
  gotosingup() {
    Get.toNamed(AppRoutes.singuproutes);
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(AppRoutes.forgetPasswrdroutes);
  }

  @override
  showandhiadpass() {
    ishiad = ishiad == true ? false : true;
    update();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      // print(value);
      // String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
