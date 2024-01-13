import 'package:flutter/material.dart';

class CustomContainerTextAuth extends StatelessWidget {
  const CustomContainerTextAuth({super.key, this.titletext, this.bodytext});
  final String? titletext;
  final String? bodytext;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(titletext!),
          const SizedBox(
            height: 10,
          ),
          Text(
            bodytext!,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 19),
          )
        ],
      ),
    );
  }
}
