import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store_app/controller/authcontroller/login_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/image_constant.dart';
import 'package:store_app/core/functions/alertexit.dart';
import 'package:store_app/core/functions/validatorinput.dart';
import 'package:store_app/view/widget/authwidget/custombutton.dart';
import 'package:store_app/view/widget/authwidget/customrow.dart';

import 'package:store_app/view/widget/authwidget/customtextfromfild.dart';
import 'package:store_app/view/widget/authwidget/customtextpage.dart';
import 'package:store_app/view/widget/authwidget/customtextsinginandsingup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "9".tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryappcolor,
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: alertexit,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingReqwestData(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formkey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Image.asset(
                      AppImages.klogo,
                      height: 160,
                    ),
                    CustomContainerTextAuth(
                      titletext: "10".tr,
                      bodytext: "11".tr,
                    ),
                    const SizedBox(
                      height: 30,
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
                    CustomRowForget(
                      onpress: () {
                        controller.gotoforgetpassword();
                      },
                    ),
                    CustomButtonAuth(
                      textbutton: "9".tr,
                      onpress: () {
                        controller.login();
                      },
                    ),
                    CustomTextSingupAndSingin(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onpress: () async {
                          await controller.gotosingup();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
