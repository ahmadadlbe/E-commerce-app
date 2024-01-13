import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colorsapp.dart';

Future<bool> alertexit() {
  Get.defaultDialog(
    title: "53".tr,
    content: Text("54".tr),
    actions: [
      Container(
        color: AppColors.primaryappcolor,
        child: MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: Text("55".tr),
        ),
      ),
      Container(
        color: AppColors.primaryappcolor,
        child: MaterialButton(
          onPressed: () {
            exit(0);
          },
          child: Text("56".tr),
        ),
      ),
    ],
  );
  return Future.value(true);
}
