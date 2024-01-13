import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomButtonBar extends StatelessWidget {
  const CustomButtonBar(
      {super.key,
      required this.onPressed,
      // required this.textbar,
      required this.iconbar,
      required this.isactiv});
  final void Function() onPressed;
  // final String textbar;
  final IconData iconbar;

  final bool isactiv;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          onPressed: onPressed,
          child: Icon(
            iconbar,
            color: isactiv == true ? AppColors.primaryappcolor : Colors.black,
          ),
        ),
        // Text(
        //   textbar,
        //   style: TextStyle(
        //     color: isactiv == true ? AppColors.primaryappcolor : Colors.black,
        //   ),
        // ),
      ],
    );
  }
}
