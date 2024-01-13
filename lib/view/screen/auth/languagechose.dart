import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/alertexit.dart';
import 'package:store_app/core/localization/changelocal.dart';
import 'package:store_app/view/widget/languagewidget/custombutton.dart';

class LanguageScreen extends GetView<Localcontroller> {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertexit,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1".tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButtonLanguageChose(
                textbutton: "العربية",
                onpreass: () {
                  controller.onchangelang("ar");
                  Get.toNamed(AppRoutes.onboardingroutes);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButtonLanguageChose(
                textbutton: "English",
                onpreass: () {
                  controller.onchangelang("en");
                  Get.toNamed(AppRoutes.onboardingroutes);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
