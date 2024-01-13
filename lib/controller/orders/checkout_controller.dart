import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/address_data.dart';
import 'package:store_app/data/datasource/remote/order/checkout_data.dart';
import 'package:store_app/data/model/address_model.dart';

class CheckoutController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  String? payment;
  DateTime datat = DateTime.now();
  String? deliverytype;
  String? addressid = "0";
  String? totalprice;
  String total = "10";
  late String couponid;
  late String coupondiscount;
  AddressData addressData = Get.put(AddressData(Get.find()));
  MyService myService = Get.find();
  List<AddressModel> dataaddress = [];
  CheckOutData checkOutData = CheckOutData(Get.find());

  chosepaymentmethod(String val) {
    payment = val;

    update();
  }

  chosedeliverytype(String val) {
    deliverytype = val;
    if (deliverytype == "0" && dataaddress.isEmpty) {
      Get.toNamed(AppRoutes.addressAddrouts);
    }

    update();
  }

  choseaddressdelivery(String val) {
    addressid = val;
    update();
  }

  getaddressdata() async {
    statusRequest = StatusRequest.loading;
    var respon = await addressData.getAddress(
        userid: myService.sharPreferences.getString("userid")!);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        dataaddress.clear();
        List listrespon = respon['data'];
        dataaddress.addAll(listrespon.map((e) => AddressModel.fromJson(e)));
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(middleText: "88".tr);
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  checkoutorder() async {
    if (payment == null) {
      return Get.defaultDialog(middleText: "chose payment");
    }
    if (deliverytype == null) {
      return Get.defaultDialog(middleText: "chose delivry type");
    }
    if (deliverytype == "0" && addressid == "0") {
      return Get.defaultDialog(middleText: "chose address");
    }

    statusRequest = StatusRequest.loading;
    update();
    var respon = await checkOutData.getdata(
      usersid: myService.sharPreferences.getString("userid")!,
      addressid: addressid.toString(),
      couponid: couponid,
      ordersprice: totalprice!,
      orderstype: deliverytype.toString(),
      paymentmethod: payment.toString(),
      coupondiscount: coupondiscount.toString(),
      pricedelivery: "10",
    );
    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      Get.snackbar("success", "success");
      Get.offAllNamed(AppRoutes.homepageroutes);
    } else {
      Get.snackbar("erorr", "try agin");
    }
    statusRequest = StatusRequest.none;
    update();
  }

  ini() async {
    totalprice = Get.arguments['totalprice'];
    couponid = Get.arguments['couponid'];
    coupondiscount = Get.arguments['coupondiscount'].toString();
    getaddressdata();
  }

  Future refreshindicators() async {
    await ini();
  }

  @override
  void onInit() {
    ini();
    super.onInit();
  }
}
