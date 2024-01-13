import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class OrderDetailsData {
  Crud crud = Crud();
  OrderDetailsData(this.crud);
  getdata({required String orderid}) async {
    var respon =
        await crud.postrequest(AppLink.orderdetails, {"orderid": orderid});
    return respon.fold((l) => l, (r) => r);
  }
}
