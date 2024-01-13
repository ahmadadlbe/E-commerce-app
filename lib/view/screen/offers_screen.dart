import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/favorite_controller.dart';
import 'package:store_app/controller/offer_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/view/widget/customappbar.dart';
import 'package:store_app/view/widget/offer/offercardlist.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    Get.put(FavoriteController());

    return Container(
      padding: const EdgeInsets.all(15),
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
          GetBuilder<OfferController>(
            builder: (controller) => HandlingVeiwData(
                statusRequest: controller.statusRequest,
                widget: RefreshIndicator(
                  onRefresh: () => controller.refreshindicators(),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.5),
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) =>
                        CustomCardoffer(itemsModel: controller.data[index]),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
