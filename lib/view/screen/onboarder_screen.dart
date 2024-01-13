import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/onboardingcontroller/onboarding_controller.dart';
import 'package:store_app/view/widget/onboardingwidget/custombutton.dart';
import 'package:store_app/view/widget/onboardingwidget/customdotcontroller.dart';
import 'package:store_app/view/widget/onboardingwidget/customslider.dart';

class OnboardeingScreen extends StatelessWidget {
  const OnboardeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControolerIm());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 3, child: CustomSliderOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  SizedBox(
                    height: 80,
                  ),
                  CustombuttonOnBoarding(),
                ],
              ))
        ],
      )),
    );
  }
}
