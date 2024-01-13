import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class CheckOutData {
  Crud crud = Crud();
  CheckOutData(this.crud);
  getdata({
    required String usersid,
    required String addressid,
    required String orderstype,
    required String pricedelivery,
    required String ordersprice,
    required String couponid,
    required String paymentmethod,
    required String coupondiscount,
    // required String ordersdatetime,
  }) async {
    var respon = await crud.postrequest(AppLink.ordercheck, {
      "usersid": usersid,
      "addressid": addressid,
      "orderstype": orderstype,
      "pricedelivery": pricedelivery,
      "ordersprice": ordersprice,
      "couponid": couponid,
      "paymentmethod": paymentmethod,
      "coupondiscount": coupondiscount,
      // "ordersdatetime": ordersdatetime
    });
    return respon.fold((l) => l, (r) => r);
  }
}
