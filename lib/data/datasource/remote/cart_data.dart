import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class CartData {
  Crud crud = Crud();
  CartData(this.crud);
  cartAdd(String userid, String itemsid) async {
    var respon = await crud
        .postrequest(AppLink.cartadd, {"userid": userid, "itemsid": itemsid});
    return respon.fold((l) => l, (r) => r);
  }

  cartRemove(String userid, String itemsid) async {
    var respon = await crud.postrequest(
        AppLink.cartremove, {"userid": userid, "itemsid": itemsid});
    return respon.fold((l) => l, (r) => r);
  }

  cartView(String userid) async {
    var respon = await crud.postrequest(AppLink.cartview, {"userid": userid});
    return respon.fold((l) => l, (r) => r);
  }

  cartgetcount(String userid, String itemsid) async {
    var respon = await crud
        .postrequest(AppLink.cartcount, {"userid": userid, "itemsid": itemsid});
    return respon.fold((l) => l, (r) => r);
  }

  couponget({required String name}) async {
    var respon =
        await crud.postrequest(AppLink.couponView, {"couponname": name});
    return respon.fold((l) => l, (r) => r);
  }
}
