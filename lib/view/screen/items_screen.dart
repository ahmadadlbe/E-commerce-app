import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/favorite_controller.dart';
import 'package:store_app/controller/items_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/data/model/items_model.dart';
import 'package:store_app/view/widget/customappbar.dart';
import 'package:store_app/view/widget/items/customCarditems.dart';
import 'package:store_app/view/widget/items/customlistcatigoresitems.dart';

import '../widget/home/customsearchlist.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            CustomAppBar(
                mycontrooler: controller.searchcontroller!,
                iconsearchPress: () {
                  controller.onsearch();
                },
                onChange: (val) {
                  controller.checksearch(val);
                },
                searshtext: "63".tr,
                iconfavoritePress: () {
                  Get.toNamed(AppRoutes.favoriterouts);
                }),
            const CustomlistcategoriesItems(),
            GetBuilder<ItemsControllerImp>(builder: (controller) {
              return HandlingVeiwData(
                  statusRequest: controller.statusRequest,
                  widget: RefreshIndicator(
                      onRefresh: () => controller.refreshindicators(),
                      child: controller.issearch == false
                          ? GridView.builder(
                              itemCount: controller.items.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: Get.width / 1100,
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                controllerfav.isfavorite[controller.items[index]
                                        ['items_id']] =
                                    controller.items[index]['isfavorite'];

                                return CustomCardItems(
                                  itemsModel: ItemsModel.fromJson(
                                      controller.items[index]),
                                );
                              },
                            )
                          : Column(mainAxisSize: MainAxisSize.min, children: [
                              ...List.generate(
                                  controller.searchlist.length,
                                  (index) => CustomListSearch(
                                        itemname: controller
                                            .searchlist[index].itemsName,
                                        imagepath:
                                            "${AppLink.itemsimage}/${controller.searchlist[index].itemsImage}",
                                        onTap: () {
                                          controller.goToitemsdetils(
                                              controller.searchlist[index]);
                                        },
                                      ))
                            ])));
            })
          ],
        ),
      ),
    );
  }
}
