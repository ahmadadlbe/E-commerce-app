import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/onboardingcontroller/onboarding_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/data/datasource/static/onboarding_static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControolerIm>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onboardinglist.length,
              (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 700),
                    margin: const EdgeInsets.all(8),
                    width: controller.currentpage == index ? 25 : 10,
                    height: 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryappcolor),
                  )),
        ],
      ),
    );
  }
}
