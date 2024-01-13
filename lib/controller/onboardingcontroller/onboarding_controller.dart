import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/static/onboarding_static.dart';

abstract class OnBoardingControoler extends GetxController {
  next();
  onpagechange(int pagenumber);
}

class OnBoardingControolerIm extends OnBoardingControoler {
  MyService myService = Get.find();
  int currentpage = 0;
  late PageController pageController;
  @override
  next() {
    currentpage++;
    if (currentpage > onboardinglist.length - 1) {
      myService.sharPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.loginroutes);
    }
    pageController.animateToPage(currentpage,
        curve: Curves.ease, duration: const Duration(milliseconds: 900));
    update();
  }

  @override
  onpagechange(pagenumber) {
    currentpage = pagenumber;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
