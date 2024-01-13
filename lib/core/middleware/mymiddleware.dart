import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/services/service.dart';

class MyMiddlewaer extends GetMiddleware {
  MyService myService = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoutes.homepageroutes);
    }
    if (myService.sharPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutes.loginroutes);
    }
    return null;
  }
}
