import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';

abstract class SuccessresetpasswordController extends GetxController {
  gotologin() {}
}

class SuccessresetpasswordControllerImp extends SuccessresetpasswordController {
  @override
  gotologin() {
    Get.offAllNamed(AppRoutes.loginroutes);
  }
}
