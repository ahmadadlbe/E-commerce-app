import 'package:store_app/core/class/statusreqwest.dart';

handlingData(respon) {
  if (respon is StatusRequest) {
    return respon;
  } else {
    return StatusRequest.success;
  }
}
