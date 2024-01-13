import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/authcontroller/resetpassword_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/image_constant.dart';
import 'package:store_app/core/functions/alertexit.dart';
import 'package:store_app/core/functions/validatorinput.dart';
import 'package:store_app/view/widget/authwidget/custombutton.dart';

import 'package:store_app/view/widget/authwidget/customtextfromfild.dart';
import 'package:store_app/view/widget/authwidget/customtextpage.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "39".tr,
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
        child: GetBuilder<ResetPasswordControllerImp>(
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
                    CustomContainerTextAuth(titletext: "", bodytext: "34".tr),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFromFildAuth(
                      obscureText: true,
                      onTapicon: () => controller.showandhiadpass,
                      isnumber: true,
                      valid: (val) {
                        return validateinput(
                            val: val!, min: 5, max: 30, type: "password");
                      },
                      mycontroller: controller.password,
                      textlabel: "40".tr,
                      texthint: "41".tr,
                      iconsuffix: const Icon(Icons.lock_outline_sharp),
                    ),
                    CustomTextFromFildAuth(
                      obscureText: true,
                      onTapicon: () => controller.showandhiadpass,
                      isnumber: true,
                      valid: (val) {
                        return validateinput(
                            val: val!, min: 5, max: 30, type: "password");
                      },
                      mycontroller: controller.repassword,
                      textlabel: "42".tr,
                      texthint: "43".tr,
                      iconsuffix: const Icon(Icons.lock_outline_sharp),
                    ),
                    CustomButtonAuth(
                      textbutton: "44".tr,
                      onpress: () {
                        controller.resetpassword();
                      },
                    ),
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
