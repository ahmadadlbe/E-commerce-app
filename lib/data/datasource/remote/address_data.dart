import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class AddressData {
  Crud crud = Crud();
  AddressData(this.crud);
  addAddress({
    required String userid,
    required String name,
    required String city,
    required String street,
    required String lat,
    required String long,
  }) async {
    var respon = await crud.postrequest(AppLink.addressAdd, {
      "userid": userid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return respon.fold((l) => l, (r) => r);
  }

  getAddress({required String userid}) async {
    var respon =
        await crud.postrequest(AppLink.addressView, {"userid": userid});
    return respon.fold((l) => l, (r) => r);
  }

  deleteAddress({required String addressid}) async {
    var respon =
        await crud.postrequest(AppLink.addressDelete, {"addressid": addressid});
    return respon.fold((l) => l, (r) => r);
  }

  editeAddress() async {
    var respon = await crud.postrequest(AppLink.testlink, {});
    return respon.fold((l) => l, (r) => r);
  }
}
