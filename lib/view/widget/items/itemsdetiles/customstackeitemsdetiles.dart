import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/itemsdetils_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/links.dart';

class CustomStackeItemsDetiles extends GetView<ItemsDetilesControllerImp> {
  const CustomStackeItemsDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
              color: AppColors.primaryappcolor,
              borderRadius: BorderRadius.circular(10)),
        ),
        Positioned(
          left: Get.width / 12,
          right: Get.width / 12,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.itemsimage}/${controller.itemsModel.itemsImage}",
                height: 250,
                fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}
