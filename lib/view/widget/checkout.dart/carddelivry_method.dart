import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomCardDilevryCheckout extends StatelessWidget {
  const CustomCardDilevryCheckout(
      {super.key,
      required this.title,
      required this.image,
      required this.isactiv,
      required this.onTap});
  final String title;
  final String image;
  final bool isactiv;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: isactiv == true ? AppColors.secndryappcolor : null,
            border: Border.all(color: AppColors.primaryappcolor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        width: 130,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image,
                color: isactiv == true ? AppColors.whiteappcolor : null),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: isactiv == true
                    ? AppColors.whiteappcolor
                    : AppColors.primaryappcolor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
