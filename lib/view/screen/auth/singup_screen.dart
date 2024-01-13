import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/authcontroller/singup_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/functions/alertexit.dart';
import 'package:store_app/core/functions/validatorinput.dart';
import 'package:store_app/view/widget/authwidget/custombutton.dart';

import 'package:store_app/view/widget/authwidget/customtextfromfild.dart';
import 'package:store_app/view/widget/authwidget/customtextpage.dart';
import 'package:store_app/view/widget/authwidget/customtextsinginandsingup.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SingUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "17".tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryappcolor,
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: () {
          return alertexit();
        },
        child: WillPopScope(
          onWillPop: alertexit,
          child: GetBuilder<SingUpControllerImp>(
            builder: (controller) => HandlingReqwestData(
              statusRequest: controller.statusRequest,
              widget: Form(
                key: controller.formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      CustomContainerTextAuth(
                        titletext: "19".tr,
                        bodytext: "20".tr,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomTextFromFildAuth(
                        isnumber: false,
                        valid: (val) {
                          return validateinput(
                              val: val!, min: 3, max: 20, type: "username");
                        },
                        mycontroller: controller.username,
                        textlabel: "21".tr,
                        texthint: "22".tr,
                        iconsuffix: const Icon(Icons.person),
                      ),
                      CustomTextFromFildAuth(
                        isnumber: false,
                        valid: (val) {
                          return validateinput(
                              val: val!, min: 5, max: 100, type: "email");
                        },
                        mycontroller: controller.email,
                        textlabel: "12".tr,
                        texthint: "13".tr,
                        iconsuffix: const Icon(Icons.email),
                      ),
                      CustomTextFromFildAuth(
                        isnumber: false,
                        valid: (val) {
                          return validateinput(
                              val: val!, min: 6, max: 30, type: "phone");
                        },
                        mycontroller: controller.phone,
                        textlabel: "23".tr,
                        texthint: "24".tr,
                        iconsuffix: const Icon(Icons.phone),
                      ),
                      CustomTextFromFildAuth(
                        obscureText: controller.ishiad,
                        onTapicon: () {
                          controller.showandhiadpass();
                        },
                        isnumber: true,
                        valid: (val) {
                          return validateinput(
                              val: val!, min: 5, max: 30, type: "password");
                        },
                        mycontroller: controller.password,
                        textlabel: "14".tr,
                        texthint: "15".tr,
                        iconsuffix: const Icon(Icons.lock_outline_sharp),
                      ),
                      CustomButtonAuth(
                        textbutton: "17".tr,
                        onpress: () {
                          controller.singup();
                        },
                      ),
                      CustomTextSingupAndSingin(
                        textone: "25".tr,
                        texttwo: "9".tr,
                        onpress: () {
                          controller.gotologin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
