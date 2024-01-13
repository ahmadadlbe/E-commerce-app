import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class OrderArchiveData {
  Crud crud = Crud();
  OrderArchiveData(this.crud);
  getdata({required String userid}) async {
    var respon =
        await crud.postrequest(AppLink.orderarchive, {"usersid": userid});
    return respon.fold((l) => l, (r) => r);
  }

  submintrating({
    required String orderid,
    required String rating,
    required String comment,
  }) async {
    var respon = await crud.postrequest(AppLink.orderrating,
        {"orderid": orderid, "rating": rating, "comment": comment});
    return respon.fold((l) => l, (r) => r);
  }
}
