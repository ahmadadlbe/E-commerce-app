import 'package:get/get.dart';

validateinput(
    {required String val,
    required int min,
    required int max,
    required String type}) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "46".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "47".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "49".tr;
    }
  }

  if (val.length < min) {
    return " ${"50".tr}$min";
  }
  if (val.length > max) {
    return " ${"51".tr}$max";
  }
  if (val.isEmpty) {
    return "52".tr;
  }
}
