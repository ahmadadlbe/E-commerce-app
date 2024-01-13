import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomTextHome extends StatelessWidget {
  const CustomTextHome({super.key, required this.textis});
  final String textis;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        textis,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryappcolor),
      ),
    );
  }
}
