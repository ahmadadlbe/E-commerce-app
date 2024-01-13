import 'package:get/get.dart';
import 'package:store_app/core/services/service.dart';

transletData(columnAr, columnEn) {
  MyService myService = Get.find();
  if (myService.sharPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
