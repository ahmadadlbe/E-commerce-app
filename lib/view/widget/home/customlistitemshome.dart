import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/core/functions/transletdata.dart';
import 'package:store_app/data/model/items_model.dart';

class CustomItemsListHome extends GetView<HomePageControllerImp> {
  const CustomItemsListHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          itemCount: controller.items.length,
          itemBuilder: (context, index) => CustomeItems(
                itemsModel: ItemsModel.fromJson(controller.items[index]),
                onTap: () {
                  controller.goToitemsdetils(
                      ItemsModel.fromJson(controller.items[index]));
                },
              )),
    );
  }
}

class CustomeItems extends StatelessWidget {
  const CustomeItems(
      {super.key, required this.itemsModel, required this.onTap});
  final ItemsModel itemsModel;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 120,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              top: 1,
              bottom: 1,
              right: 1,
              left: 1,
              child: Image.network(
                "${AppLink.itemsimage}/${itemsModel.itemsImage}",
                width: 200,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 210,
              decoration: BoxDecoration(
                  color: AppColors.blackappcolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
            ),
            Positioned(
              left: 15,
              top: 10,
              child: Text(
                "${transletData(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                style: TextStyle(fontSize: 17, color: AppColors.whiteappcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
