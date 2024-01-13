import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/favorite_screen_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/view/widget/favorite/customcurdfavorite.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteScreenController());
    return Scaffold(
        body: GetBuilder<FavoriteScreenController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            // CustomAppBar(
            //     iconsearchPress: () {},
            //     onChange: (p0) {},
            //     searshtext: "63".tr,
            //     iconNotfaionPress: () {},
            //     iconfavoritePress: () {
            //       Get.toNamed(AppRoutes.favoriterouts);
            //     }),
            HandlingVeiwData(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.4,
                    crossAxisCount: 2,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.datafavorite.length,
                  itemBuilder: (context, index) {
                    return CustomCardfavorite(
                      favoriteModel: controller.datafavorite[index],
                    );
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
