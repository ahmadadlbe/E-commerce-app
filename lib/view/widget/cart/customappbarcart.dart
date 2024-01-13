import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomAppBarCart extends StatelessWidget {
  const CustomAppBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          alignment: Alignment.centerLeft,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              )),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "My Cart",
            style: TextStyle(fontSize: 30, color: AppColors.grayappcolor),
          ),
        ),
      ],
    );
  }
}
