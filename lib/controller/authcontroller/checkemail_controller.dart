import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';

abstract class CheckEmailController extends GetxController {
  checkemail() {}
}

class CheckEmailControllerImp extends CheckEmailController {
  GlobalKey<FormState> formkey = GlobalKey();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  checkemail() {
    Get.offAllNamed(AppRoutes.loginroutes);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
