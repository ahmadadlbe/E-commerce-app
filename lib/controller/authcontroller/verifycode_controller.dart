import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/data/datasource/remote/auth/forgetpassword/verifiycodeforgetdata.dart';

abstract class VerifyCodeController extends GetxController {
  checkcode(String verificationCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifiyCodeForgetpasswordData verifiyCodeForgetpasswordData =
      VerifiyCodeForgetpasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  @override
  checkcode(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await verifiyCodeForgetpasswordData.postVerifiyCodeData(
        useremail: email!, verifiycode: verificationCode);

    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.toNamed(AppRoutes.resetPasswordroutes,
            arguments: {"useremail": email});
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "58".tr);
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['useremail'];
    super.onInit();
  }
}
