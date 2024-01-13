import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/items_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/functions/transletdata.dart';
import 'package:store_app/data/model/categories_model.dart';

class CustomlistcategoriesItems extends GetView<ItemsControllerImp> {
  const CustomlistcategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        height: 60,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoris.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          itemBuilder: (context, index) => CatigoresCustom(
            selectedcat: index,
            catid: controller.categoris[index]['categories_id'],
            categoriesModel:
                CategoriesModel.fromJson(controller.categoris[index]),
          ),
        ));
  }
}

class CatigoresCustom extends GetView<ItemsControllerImp> {
  const CatigoresCustom({
    super.key,
    required this.categoriesModel,
    required this.selectedcat,
    required this.catid,
  });
  final int selectedcat;
  final CategoriesModel categoriesModel;
  final String catid;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changecat(selectedcat, catid);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              decoration: controller.selectedcat == selectedcat
                  ? BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3, color: AppColors.primaryappcolor)))
                  : const BoxDecoration(),
              child: SizedBox(
                height: 40,
                child: Text(
                    "${transletData(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
