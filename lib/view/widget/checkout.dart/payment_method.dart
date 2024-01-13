import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomPymantCardCheckout extends StatelessWidget {
  const CustomPymantCardCheckout(
      {super.key,
      required this.title,
      required this.isactiv,
      required this.onTap});

  final String? title;
  final bool? isactiv;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            color: isactiv == false
                ? AppColors.primaryappcolor
                : AppColors.secndryappcolor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          "$title",
          style: TextStyle(color: AppColors.whiteappcolor),
        ),
      ),
    );
  }
}
