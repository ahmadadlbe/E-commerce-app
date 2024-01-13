import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/cart_data.dart';
import 'package:store_app/data/model/cart_mode.dart';
import 'package:store_app/data/model/coupon_model.dart';

class CartControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  int counttotal = 0;
  double totalprice = 0.0;
  TextEditingController? couponcontroller;
  CouponModel? couponModel;
  int? discount = 0;
  String? couponname;
  String? couponid;
  double price = 0.0;

  @override
  void onInit() {
    cartview();
    couponcontroller = TextEditingController();
    super.onInit();
  }

  cartview() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await cartData.cartView(
      myService.sharPreferences.getString("userid")!,
    );
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        if (respon['datacart']['status'] == "success") {
          List responsdata = respon['datacart']['data'];
          data.addAll(responsdata.map((e) => CartModel.fromJson(e)));

          Map respondatatoal = respon['countprice'];

          counttotal = int.parse(respondatatoal['totalcount']);
          price = double.parse(respondatatoal['totalprice']);
          totalprice = (price - price * discount! / 100);
        }
      }
    }
    update();
  }

  Future refreshindicators() async {
    await cartview();
  }

  reset() {
    counttotal = 0;
    price = 0;
    totalprice = 0.0;
    data.clear();
  }

  refreshpage() {
    reset();
    cartview();
  }

  cartadd(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await cartData.cartAdd(
        myService.sharPreferences.getString("userid")!, itemsid);

    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.snackbar("53".tr, "Added");
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "failure");
      }
    }
    update();
  }

  cartremov(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await cartData.cartRemove(
        myService.sharPreferences.getString("userid")!, itemsid);
    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.snackbar("53".tr, "Undeleted");
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "failure");
      }
    }
    update();
  }

  couponcheck() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await cartData.couponget(name: couponcontroller!.text);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Map<String, dynamic> datarespon = respon['data'];
        couponModel = CouponModel.fromJson(datarespon);
        discount = int.parse(couponModel!.couponDiscount!);
        couponname = (couponModel!.couponName!).toString();
        couponid = (couponModel!.couponId!).toString();
        totalprice = (price - price * discount! / 100);
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: " Coupon does not exist");
      }
    }
    update();
  }

  gotochechout() {
    if (data.isEmpty) {
      return Get.snackbar('53'.tr, "  There are no products in the cart ");
    } else {
      Get.toNamed(AppRoutes.checkOutrouts, arguments: {
        "couponid": couponid ?? "0",
        "totalprice": totalprice.toString(),
        "coupondiscount": discount ?? "0",
      });
    }
  }

  // gettotalpricediscount() {
  //   return
  // }
}
