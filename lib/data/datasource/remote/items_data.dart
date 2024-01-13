import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class ItemsData {
  Crud crud = Crud();
  ItemsData(this.crud);
  getItemsdata(String id, String userid) async {
    var respon = await crud
        .postrequest(AppLink.itemslink, {"catid": id, "userid": userid});
    return respon.fold((l) => l, (r) => r);
  }
}
