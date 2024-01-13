import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/onboardingcontroller/onboarding_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustombuttonOnBoarding extends GetView<OnBoardingControolerIm> {
  const CustombuttonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        controller.next();
      },
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryappcolor,
        ),
        child: Text(
          "8".tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
