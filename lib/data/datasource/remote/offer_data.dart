import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class OfferData {
  Crud crud = Crud();
  OfferData(this.crud);
  getdata() async {
    var respon = await crud.postrequest(AppLink.offers, {});
    return respon.fold((l) => l, (r) => r);
  }
}
