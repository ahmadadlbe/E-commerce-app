import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/favorite_data.dart';
import 'package:store_app/data/model/favorite_model.dart';

class FavoriteController extends GetxController {
  Map isfavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List<FavoriteModel> datafavorite = [];
  FavoriteModel favoriteModel = FavoriteModel();

  setfavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addfavorite(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await favoriteData.favoriteAdd(
        myService.sharPreferences.getString("userid")!, itemsid);
    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.snackbar("alert", "72".tr);
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "57".tr);
      }
    }
  }

  removefavorite(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await favoriteData.favoriteRemove(
        myService.sharPreferences.getString("userid")!, itemsid);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.rawSnackbar(messageText: Text("71".tr));
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "57".tr);
      }
    }
  }
}
