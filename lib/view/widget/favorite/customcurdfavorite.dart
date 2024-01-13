import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/favorite_controller.dart';
import 'package:store_app/controller/favorite_screen_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/core/functions/transletdata.dart';
import 'package:store_app/data/model/favorite_model.dart';

class CustomCardfavorite extends GetView<FavoriteController> {
  const CustomCardfavorite({super.key, required this.favoriteModel});
  final FavoriteModel favoriteModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "${favoriteModel.itemsId}",
              child: CachedNetworkImage(
                  imageUrl: "${AppLink.itemsimage}/${favoriteModel.itemsImage}",
                  height: 200,
                  fit: BoxFit.cover),
            ),
            Text(
              "${transletData(favoriteModel.itemsNameAr, favoriteModel.itemsName)}",
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${favoriteModel.itemsPrice}\$"),
                GetBuilder<FavoriteScreenController>(
                  builder: (controller) => IconButton(
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: AppColors.primaryappcolor,
                    ),
                    onPressed: () {
                      controller.deletfromfavorite(favoriteModel.favoriteId);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
