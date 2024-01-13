import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomButtonLanguageChose extends StatelessWidget {
  final void Function()? onpreass;
  const CustomButtonLanguageChose(
      {super.key, required this.textbutton, required this.onpreass});
  final String textbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryappcolor,
      width: 180,
      height: 50,
      child: MaterialButton(
        onPressed: onpreass,
        child: Text(
          textbutton,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
