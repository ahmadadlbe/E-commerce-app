import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/screen/homepage_screen.dart';
import 'package:store_app/view/screen/notification_screen.dart';
import 'package:store_app/view/screen/offers_screen.dart';
import 'package:store_app/view/screen/settings_screen.dart';

abstract class HomeBarScreenController extends GetxController {
  changepage(int i);
}

class HomeBarScreenControllerImp extends HomeBarScreenController {
  int pagenumber = 0;
  List<Widget> pagelist = [
    const HomePageScreen(),
    const NotificationScreen(),
    const OfferScreen(),
    const SettingsScreen(),
  ];
  List buttonbar = [
    {
      "title": "home",
      "icon": Icons.home,
    },
    {
      "title": "notyfaiy",
      "icon": Icons.notifications_none,
    },
    {
      "title": "personal",
      "icon": Icons.sell,
    },
    {
      "title": "settings",
      "icon": Icons.settings,
    }
  ];

  @override
  changepage(int i) {
    pagenumber = i;

    update();
  }
}
