import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/favorite_controller.dart';
import 'package:store_app/controller/items_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/image_constant.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/core/functions/transletdata.dart';
import 'package:store_app/data/model/items_model.dart';

class CustomCardItems extends GetView<ItemsControllerImp> {
  const CustomCardItems({super.key, required this.itemsModel});
  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToitemsdetils(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.itemsimage}/${itemsModel.itemsImage}",
                        height: 150,
                        fit: BoxFit.contain),
                  ),
                  Text(
                    "${transletData(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.timer_sharp),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${controller.dilevrytime} - ${int.parse(controller.dilevrytime) + 15}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("${(itemsModel.itemsPriceDiscuont)} \$"),
                          Text(
                            itemsModel.itemsDiscount == "0"
                                ? ""
                                : "${itemsModel.itemsPrice}",
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          icon: controller.isfavorite[itemsModel.itemsId] == "0"
                              ? Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColors.primaryappcolor,
                                )
                              : Icon(
                                  Icons.favorite,
                                  color: AppColors.primaryappcolor,
                                ),
                          onPressed: () {
                            if (controller.isfavorite[itemsModel.itemsId] ==
                                "0") {
                              controller.addfavorite(itemsModel.itemsId);
                              controller.setfavorite(itemsModel.itemsId, "1");
                            } else {
                              controller.removefavorite(itemsModel.itemsId);
                              controller.setfavorite(itemsModel.itemsId, "0");
                            }
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
              itemsModel.itemsDiscount != "0"
                  ? Positioned(
                      top: 1,
                      child: Image.asset(
                        AppImages.sellimage,
                        height: 40,
                      ))
                  : const Center()
            ],
          ),
        ),
      ),
    );
  }
}
