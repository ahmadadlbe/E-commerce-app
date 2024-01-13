import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class NotificationData {
  Crud crud = Crud();
  NotificationData(this.crud);
  getnotification({required String userid}) async {
    var respon =
        await crud.postrequest(AppLink.notification, {"userid": userid});
    return respon.fold((l) => l, (r) => r);
  }
}
