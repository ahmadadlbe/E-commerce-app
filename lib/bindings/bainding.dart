import 'package:get/get.dart';
import 'package:store_app/core/class/curd.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
