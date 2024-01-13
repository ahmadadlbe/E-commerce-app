import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';

import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/items_data.dart';
import 'package:store_app/data/model/items_model.dart';

class ItemsControllerImp extends SearchMixController {
  List categoris = [];
  int? selectedcat;
  String dilevrytime = "";
  @override
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  List items = [];

  String? catid;
  MyService myService = Get.find();
  ItemsModel itemsModel = ItemsModel();

  @override
  void onInit() {
    initData();
    searchcontroller = TextEditingController();
    super.onInit();
  }

  Future refreshindicators() async {
    await initData();
    searchcontroller = TextEditingController();
  }

  changecat(int val, String s) {
    selectedcat = val;
    catid = s.toString();
    getData(s);
    update();
  }

  initData() {
    dilevrytime = myService.sharPreferences.getString("dilevrytime")!;
    categoris = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];

    getData(catid!);
  }

  getData(String categoriesid) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var respon = await itemsData.getItemsdata(
        categoriesid, myService.sharPreferences.getString("userid")!);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        items.addAll(respon['data']);
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "No products found");
      }
    }
    update();
  }

  goToitemsdetils(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.iditelsroutes, arguments: {"itemsmodel": itemsModel});
  }
}
