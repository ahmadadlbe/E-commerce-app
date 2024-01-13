import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomTopCart extends StatelessWidget {
  const CustomTopCart({super.key, required this.count});
  final String count;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.primaryappcolor,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        "items count is $count",
        style: TextStyle(color: AppColors.whiteappcolor),
      ),
    );
  }
}
