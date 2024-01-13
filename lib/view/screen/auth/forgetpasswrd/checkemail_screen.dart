import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/authcontroller/checkemail_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/functions/alertexit.dart';
import 'package:store_app/core/functions/validatorinput.dart';
import 'package:store_app/view/widget/authwidget/custombutton.dart';

import 'package:store_app/view/widget/authwidget/customtextfromfild.dart';
import 'package:store_app/view/widget/authwidget/customtextpage.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "26".tr,
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
        child: GetBuilder<CheckEmailControllerImp>(
          builder: (controller) => HandlingReqwestData(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formkey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    CustomContainerTextAuth(titletext: " ", bodytext: "45".tr),
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
                    CustomButtonAuth(
                      textbutton: "30".tr,
                      onpress: () {
                        controller.checkemail();
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
