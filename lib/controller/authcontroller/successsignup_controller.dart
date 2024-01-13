import 'package:get/get.dart';
import 'package:store_app/core/constant/routesname.dart';

abstract class SuccessSignUpController extends GetxController {
  gotologin() {}
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  gotologin() {
    Get.offAllNamed(AppRoutes.loginroutes);
  }
}
