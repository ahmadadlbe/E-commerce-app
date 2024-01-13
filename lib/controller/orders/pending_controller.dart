import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/order/pending_data.dart';
import 'package:store_app/data/model/orders_model.dart';

class PendingController extends GetxController {
  MyService myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<OrdersModel> data = [];
  PendingData pendingData = PendingData(Get.find());

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respon = await pendingData.getdata(
        userid: myService.sharPreferences.getString("userid")!);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        List respondata = respon['data'];
        data.addAll(respondata.map((e) => OrdersModel.fromJson(e)));
      } else if (respon['status'] == "failure") {}
    }
    statusRequest = StatusRequest.none;
    update();
  }

  deleteorder(String orderid) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await pendingData.deleteorder(orderid: orderid);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        refreshpage();
        Get.defaultDialog(title: "worng", middleText: "delete success");
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "worng", middleText: "delete faliur");
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  Future refreshindicators() async {
    await getdata();
  }

  refreshpage() {
    getdata();
    update();
  }

  String printordertype(String val) {
    return val == "0" ? "Dilevry" : "revic";
  }

  String printpaymentMethod(String val) {
    return val == "0" ? "Cash" : "Cards";
  }

  String printordeStatus(String val) {
    if (val == "0") {
      return "Your application is pending approval";
    } else if (val == "1") {
      return " Your application is in preparation";
    } else if (val == "2") {
      return "Your order Has been Prepared";
    } else if (val == "3") {
      return "Your order is delivered to you";
    } else if (val == "4") {
      return "your order Done";
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
