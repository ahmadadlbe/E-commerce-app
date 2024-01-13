import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/itemsdetils_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/transletdata.dart';

import 'package:store_app/view/widget/items/itemsdetiles/customaddtocartdetiles.dart';
import 'package:store_app/view/widget/items/itemsdetiles/custompriceandcount.dart';
import 'package:store_app/view/widget/items/itemsdetiles/customstackeitemsdetiles.dart';

class ItemsDetilsScreen extends GetView<ItemsDetilesControllerImp> {
  const ItemsDetilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsDetilesControllerImp());
    return Scaffold(
      bottomNavigationBar: CustomAddCartButton(
        onTap: () {
          Get.toNamed(AppRoutes.cartrouts);
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<ItemsDetilesControllerImp>(builder: (controller) {
          return ListView(
            children: [
              const CustomStackeItemsDetiles(),
              const SizedBox(
                height: 50,
              ),
              Text(
                "${transletData(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.secndryappcolor),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPriceAndCountItems(
                  onRemove: () {
                    controller.remove();
                  },
                  onAdd: () {
                    controller.add();
                  },
                  priec: controller.itemsModel.itemsPriceDiscuont!,
                  count: controller.countitems),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${transletData(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        }),
      ),
    );
  }
}
