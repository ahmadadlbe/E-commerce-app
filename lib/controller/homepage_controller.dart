import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/home_data.dart';
import 'package:store_app/data/model/items_model.dart';

class HomePageControllerImp extends SearchMixController {
  MyService myService = Get.find();
  String? username;
  String? id;
  String? dilevrytime = "";
  String? titleCardhome = "";
  String? bodyCardhome = "";

  List categories = [];
  List items = [];
  List settings = [];
  String? lang;

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    categories.clear();
    settings.clear();
    items.clear();
    var respon = await homeData.gethomedata();

    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        categories.addAll(respon['categories']['data']);
        items.addAll(respon['items']['data']);
        settings.addAll(respon['settings']['data']);
        titleCardhome = settings[0]['settings_title'];
        bodyCardhome = settings[0]['settings_body'];
        dilevrytime = settings[0]['settings_dilivretime'];
        myService.sharPreferences.setString("dilevrytime", dilevrytime!);
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "57".tr);
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  Future refreshindicators() async {
    searchcontroller = TextEditingController();
    await getinit();
    await getdata();
  }

  getinit() {
    username = myService.sharPreferences.getString("username");
    id = myService.sharPreferences.getString("userid");
    lang = myService.sharPreferences.getString("lang");
  }

  goToitems(List categories, int selectedcat, String catid) {
    Get.toNamed(AppRoutes.itemsroutes, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "catid": catid
    });
  }

  goToitemsdetils(itemsModel) {
    Get.toNamed(AppRoutes.iditelsroutes, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    searchcontroller = TextEditingController();
    getinit();
    getdata();

    super.onInit();
  }
}

class SearchMixController extends GetxController {
  bool issearch = false;
  List<ItemsModel> searchlist = [];

  TextEditingController? searchcontroller;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  checksearch(val) {
    if (val == "") {
      issearch = false;
      statusRequest = StatusRequest.none;
    }
    update();
  }

  onsearch() {
    issearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await homeData.searsh(searchcontroller!.text);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        searchlist.clear();
        List respnsdata = respon['data'];
        searchlist.addAll(respnsdata.map((e) => ItemsModel.fromJson(e)));
        update();
      } else if (respon['status'] == "failure") {
        searchlist.clear();
        Get.defaultDialog(title: "53".tr, middleText: "This product does not exist");
      }
    }
    update();
  }

  @override
  void onInit() {
    searchcontroller = TextEditingController();
    super.onInit();
  }
}
