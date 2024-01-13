import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/core/functions/transletdata.dart';
import 'package:store_app/data/model/categories_model.dart';

class Customlistcategorieshome extends GetView<HomePageControllerImp> {
  const Customlistcategorieshome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 115,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemBuilder: (context, index) => CatigoresCustom(
            selectedcat: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          ),
        ));
  }
}

class CatigoresCustom extends GetView<HomePageControllerImp> {
  const CatigoresCustom({
    super.key,
    required this.categoriesModel,
    required this.selectedcat,
  });
  final int selectedcat;
  final CategoriesModel categoriesModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToitems(
            controller.categories, selectedcat, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primaryappcolor,
            ),
            child: SvgPicture.network(
              "${AppLink.catimage}/${categoriesModel.categoriesImage}",
              colorFilter: ColorFilter.mode(
                  AppColors.iconcategoriesappcolor, BlendMode.srcIn),
            ),
          ),
          SizedBox(
            height: 40,
            child: Text(
                "${transletData(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}"),
          )
        ],
      ),
    );
  }
}
