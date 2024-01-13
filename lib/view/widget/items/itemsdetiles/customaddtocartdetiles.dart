import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomAddCartButton extends StatelessWidget {
  const CustomAddCartButton({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: AppColors.primaryappcolor,
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          "70".tr,
          style: TextStyle(color: AppColors.whiteappcolor),
        ),
      ),
    );
  }
}
