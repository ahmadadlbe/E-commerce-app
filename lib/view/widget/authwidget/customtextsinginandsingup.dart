import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomTextSingupAndSingin extends StatelessWidget {
  const CustomTextSingupAndSingin(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onpress});
  final String textone;
  final String texttwo;
  final void Function() onpress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textone,
          style: const TextStyle(fontSize: 20),
        ),
        TextButton(
          onPressed: onpress,
          child: Text(
            texttwo,
            style: TextStyle(color: AppColors.primaryappcolor, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
