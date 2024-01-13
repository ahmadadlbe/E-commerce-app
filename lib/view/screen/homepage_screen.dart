import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/view/widget/customappbar.dart';
import 'package:store_app/view/widget/home/customcurdhome.dart';
import 'package:store_app/view/widget/home/customlistcategorieshome.dart';
import 'package:store_app/view/widget/home/customlistitemshome.dart';
import 'package:store_app/view/widget/home/customsearchlist.dart';
import 'package:store_app/view/widget/home/customtexthome.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () => controller.refreshindicators(),
        child: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(children: [
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
              HandlingVeiwData(
                  statusRequest: controller.statusRequest,
                  widget: !controller.issearch
                      ? Column(
                          children: [
                            CustomCurdHome(
                                textTitle: "${controller.titleCardhome}",
                                textBody: "${controller.bodyCardhome}"),
                            const Customlistcategorieshome(),
                            const CustomTextHome(textis: "Top Selling"),
                            const CustomItemsListHome(),
                          ],
                        )
                      : Column(mainAxisSize: MainAxisSize.min, children: [
                          ...List.generate(
                              controller.searchlist.length,
                              (index) => CustomListSearch(
                                    itemname:
                                        controller.searchlist[index].itemsName,
                                    imagepath:
                                        "${AppLink.itemsimage}/${controller.searchlist[index].itemsImage}",
                                    onTap: () {
                                      controller.goToitemsdetils(
                                          controller.searchlist[index]);
                                    },
                                  ))
                        ]))
            ])),
      ),
    );
  }
}
