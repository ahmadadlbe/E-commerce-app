import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class FavoriteData {
  Crud crud = Crud();
  FavoriteData(this.crud);
  favoriteAdd(String userid, String itemsid) async {
    var respon = await crud.postrequest(
        AppLink.favoriteadd, {"userid": userid, "itemsid": itemsid});
    return respon.fold((l) => l, (r) => r);
  }

  favoriteRemove(String userid, String itemsid) async {
    var respon = await crud.postrequest(
        AppLink.favoriteremove, {"userid": userid, "itemsid": itemsid});
    return respon.fold((l) => l, (r) => r);
  }

  favoriteView(String userid) async {
    var respon =
        await crud.postrequest(AppLink.favoriteView, {"userid": userid});
    return respon.fold((l) => l, (r) => r);
  }

  favoritedeletefrom(String favoriteid) async {
    var respon = await crud
        .postrequest(AppLink.favoritedeletefrom, {"favoriteid": favoriteid});
    return respon.fold((l) => l, (r) => r);
  }
}
