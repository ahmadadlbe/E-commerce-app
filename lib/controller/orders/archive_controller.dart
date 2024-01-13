import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/order/archive_data.dart';
import 'package:store_app/data/model/orders_model.dart';

class OrderArchiveController extends GetxController {
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  OrderArchiveData orderarchiveData = OrderArchiveData(Get.find());

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respon = await orderarchiveData.getdata(
        userid: myService.sharPreferences.getString("userid")!);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        List respondata = respon['data'];
        data.addAll(respondata.map((e) => OrdersModel.fromJson(e)));
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "82".tr);
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  Future refreshindicators() async {
    await getdata();
  }

  submintrating(
    String orderid,
    String comment,
    String rating,
  ) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await orderarchiveData.submintrating(
        orderid: orderid, comment: comment, rating: rating);
    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.defaultDialog(title: "53".tr, middleText: "32".tr);
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "61".tr);
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  refreshpage() {
    getdata();
    update();
  }

  String printordertype(String val) {
    return val == "0" ? "83".tr : "84".tr;
  }

  String printpaymentMethod(String val) {
    return val == "0" ? "85".tr : "86".tr;
  }

  String printordeStatus(String val) {
    if (val == "4") {
      return "87".tr;
    } else {
      return "";
    }
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
