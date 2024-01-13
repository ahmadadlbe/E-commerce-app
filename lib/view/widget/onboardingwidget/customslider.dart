import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/onboardingcontroller/onboarding_controller.dart';
import 'package:store_app/data/datasource/static/onboarding_static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControolerIm> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) {
        controller.onpagechange(value);
      },
      controller: controller.pageController,
      itemCount: onboardinglist.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Image.asset(
              "${onboardinglist[index].image}",
              height: 240,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text("${onboardinglist[index].title}",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
              child: Text("${onboardinglist[index].body}",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        );
      },
    );
  }
}
