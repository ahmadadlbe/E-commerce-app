import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/services/service.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingsController extends GetxController {}

class SettingsControllerImp extends SettingsController {
  MyService myService = Get.find();
  List titleandicon = [];
  bool valswitch = false;
  @override
  void onInit() {
    titleandicon = [
      {
        "title": "Orders",
        "icon": const Icon(Icons.attach_money),
        "onpress": () {
          Get.toNamed(AppRoutes.pendingrouts);
        }
      },
      {
        "title": "Archive",
        "icon": const Icon(Icons.check_box_outlined),
        "onpress": () {
          Get.toNamed(AppRoutes.archiverouts);
        }
      },
      {
        "title": "74".tr,
        "icon": const Icon(Icons.location_on_outlined),
        "onpress": () {
          Get.toNamed(AppRoutes.addressViewrouts);
        }
      },
      {
        "title": "75".tr,
        "icon": const Icon(Icons.info_outline_rounded),
        "onpress": () {}
      },
      {
        "title": "76".tr,
        "icon": const Icon(Icons.phone_callback),
        "onpress": () {
          launchUrl(Uri.parse("tel:+963999505203"));
        }
      },
      {
        "title": "77".tr,
        "icon": const Icon(Icons.logout),
        "onpress": () {
          logout();
        },
      },
    ];
    super.onInit();
  }

  logout() {
    String userid = myService.sharPreferences.getString("userid")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myService.sharPreferences.setString("step", "1");
    Get.offAllNamed(AppRoutes.loginroutes);
  }
}
