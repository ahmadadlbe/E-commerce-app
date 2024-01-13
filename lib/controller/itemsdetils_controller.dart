import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/cart_data.dart';
import 'package:store_app/data/model/items_model.dart';

abstract class ItemsDetilesController extends GetxController {}

class ItemsDetilesControllerImp extends ItemsDetilesController {
  late ItemsModel itemsModel;

  // CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  late int countitems = 0;
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  CartData cartData = CartData(Get.find());

  @override
  void onInit() async {
    inidata();

    super.onInit();
  }

  inidata() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await cartcount(itemsModel.itemsId);
    statusRequest = StatusRequest.loading;
    update();
  }

  Future refreshindicators() async {
    await inidata();
  }

  cartadd(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await cartData.cartAdd(
        myService.sharPreferences.getString("userid")!, itemsid);

    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.snackbar(
          "It's done",
          "Product added to cart",
          backgroundColor: AppColors.whiteappcolor,
        );
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
        Get.snackbar(
          "It's done",
          "Deleted successfully",
          backgroundColor: AppColors.whiteappcolor,
        );
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "failure");
      }
    }
    update();
  }

  cartcount(itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await cartData.cartgetcount(
        myService.sharPreferences.getString("userid")!, itemsid);
    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        int countitems;
        countitems = int.parse(respon['data']);
        return countitems;
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "failure");
      }
    }
  }

  add() {
    cartadd(itemsModel.itemsId);
    countitems++;
    update();
  }

  remove() {
    if (countitems > 0) {
      cartremov(itemsModel.itemsId);
      countitems--;
      update();
    }
  }

  List colorslist = [
    {
      "id": "1",
      "name": "red",
      "active": "1",
    },
    {
      "id": "2",
      "name": "blue",
      "active": "0",
    },
    {
      "id": "3",
      "name": "red",
      "active": "0",
    }
  ];
}
