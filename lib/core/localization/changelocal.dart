import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/apptheam.dart';
import 'package:store_app/core/functions/fiarebacemessaging.dart';
import 'package:store_app/core/services/service.dart';

class Localcontroller extends GetxController {
  Locale? language;
  MyService localshare = Get.put(MyService());

  ThemeData apptheme = englishtheme;

  onchangelang(String locallang) {
    Locale locale = Locale(locallang);

    localshare.sharPreferences.setString("lang", locallang);

    apptheme = locallang == "en" ? englishtheme : arabictheme;
    Get.changeTheme(apptheme);

    Get.updateLocale(locale);
  }

  requstperlocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.defaultDialog(title: "تنبيه", middleText: "تحديد الموقع غير مفعل");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  @override
  void onInit() {
    permissionsfmessage();
    fbmessageconfig();
    requstperlocation();
    String? sharedpralang = localshare.sharPreferences.getString("lang");
    if (sharedpralang == "ar") {
      language = const Locale("ar");
      apptheme = arabictheme;
    } else if (sharedpralang == "en") {
      language = const Locale("en");
      apptheme = englishtheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
