import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class HomeData {
  Crud crud = Crud();
  HomeData(this.crud);
  gethomedata() async {
    var respon = await crud.postrequest(AppLink.homelink, {});
    return respon.fold((l) => l, (r) => r);
  }

  searsh(String search) async {
    var respon = await crud.postrequest(AppLink.searsh, {"searsh": search});
    return respon.fold((l) => l, (r) => r);
  }
}
