import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/data/datasource/remote/auth/virifiycodedata.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkcode();
  gotosuccesssignup(String verifiycode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifiyCodeData verifiyCodeData = VerifiyCodeData(Get.find());
  @override
  checkcode() {}

  @override
  gotosuccesssignup(verifiycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await verifiyCodeData.postsVerifiycodedata(
        useremail: email, verifiycode: verifiycode);

    statusRequest = handlingData(respon);

    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        Get.offAllNamed(AppRoutes.succsessignuproutes);
      }
    } else {
      Get.defaultDialog(title: "53".tr, middleText: "58".tr);
    }

    update();
  }

  @override
  void onInit() {
    email = Get.arguments["useremail"];

    super.onInit();
  }

  resendverifiycode() async {
    await verifiyCodeData.resendVerifiycode(useremail: email);
  }
}
