import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/notification_data.dart';
import 'package:store_app/data/model/notification_model.dart';

class NotificationController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  MyService myService = Get.find();

  List<NotificationModel> data = [];

  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    data.clear();
    var respon = await notificationData.getnotification(
        userid: myService.sharPreferences.getString("userid")!);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      List responlist = respon['data'];
      data.addAll(responlist.map((e) => NotificationModel.fromJson(e)));
    }
    update();
  }

  Future refreshindicators() async {
    await getdata();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
