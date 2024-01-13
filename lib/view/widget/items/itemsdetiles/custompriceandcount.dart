import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomPriceAndCountItems extends StatelessWidget {
  const CustomPriceAndCountItems(
      {super.key,
      required this.count,
      required this.priec,
      required this.onRemove,
      required this.onAdd});
  final int count;
  final String priec;
  final void Function()? onRemove;
  final void Function()? onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Text(
                "$count",
                style: TextStyle(height: 1.1, color: AppColors.secndryappcolor),
              ),
            ),
            IconButton(onPressed: onRemove, icon: const Icon(Icons.remove))
          ],
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          "$priec\$",
          style: TextStyle(color: AppColors.secndryappcolor),
        )
      ],
    );
  }
}
