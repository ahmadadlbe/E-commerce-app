import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class PendingData {
  Crud crud = Crud();
  PendingData(this.crud);
  getdata({required String userid}) async {
    var respon =
        await crud.postrequest(AppLink.orderpending, {"usersid": userid});
    return respon.fold((l) => l, (r) => r);
  }

  deleteorder({required String orderid}) async {
    var respon =
        await crud.postrequest(AppLink.orderdelete, {"orderid": orderid});
    return respon.fold((l) => l, (r) => r);
  }
}
