import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomCurdHome extends GetView<HomePageControllerImp> {
  const CustomCurdHome(
      {super.key, required this.textTitle, required this.textBody});
  final String? textTitle;
  final String? textBody;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryappcolor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          alignment: Alignment.center,
          child: ListTile(
              title: Text(
                textTitle!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
              subtitle: Text(
                textBody!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white, fontSize: 30),
              )),
        ),
      ),
      Positioned(
        top: -40,
        right: controller.lang == "en" ? -50 : null,
        left: controller.lang == "ar" ? -50 : null,
        child: CircleAvatar(
          radius: 80,
          backgroundColor: AppColors.secndryappcolor,
        ),
      )
    ]);
  }
}
