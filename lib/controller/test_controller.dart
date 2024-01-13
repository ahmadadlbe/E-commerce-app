import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getdata() async {
    statusRequest = StatusRequest.loading;
    var respon = await testData.getdata();
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      data.addAll(respon['data']);
    }
    update();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
