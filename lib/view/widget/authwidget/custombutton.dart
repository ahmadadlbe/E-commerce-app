import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth(
      {super.key, required this.textbutton, required this.onpress});
  final String? textbutton;
  final void Function() onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryappcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        onPressed: onpress,
        child: Text(
          textbutton!,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
