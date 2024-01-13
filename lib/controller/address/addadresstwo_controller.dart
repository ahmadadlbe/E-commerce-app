import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/address_data.dart';

class AddAddressTwoController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;
  String? lat;
  String? lon;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? name;
  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());
  initstate() {
    lat = Get.arguments['lat'];
    lon = Get.arguments['lon'];
    city = TextEditingController();
    street = TextEditingController();
    name = TextEditingController();
    statusRequest = StatusRequest.none;
    update();
  }

  addaddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await addressData.addAddress(
        userid: myService.sharPreferences.getString("userid")!,
        city: city!.text,
        street: street!.text,
        name: name!.text,
        lat: lat!,
        long: lon!);
    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      // Get.offAllNamed(AppRoutes.homepageroutes);
      Get.back();
      Get.back();
    }
    update();
  }

  @override
  void onInit() {
    initstate();
    super.onInit();
  }
}
