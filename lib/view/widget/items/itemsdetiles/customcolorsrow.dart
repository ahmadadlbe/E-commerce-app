import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/itemsdetils_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomColorsRow extends GetView<ItemsDetilesControllerImp> {
  const CustomColorsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.colorslist.length,
          (index) => InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
              padding: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  color: AppColors.secndryappcolor,
                  borderRadius: BorderRadius.circular(10)),
              height: 60,
              width: 90,
              child: Text(
                "${controller.colorslist[index]['name']}",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.whiteappcolor),
              ),
            ),
          ),
        )
      ],
    );
  }
}
