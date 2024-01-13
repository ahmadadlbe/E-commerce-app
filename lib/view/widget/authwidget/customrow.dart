import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRowForget extends StatelessWidget {
  const CustomRowForget({super.key, required this.onpress});
  final void Function() onpress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onpress,
          child: Text("18".tr),
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
