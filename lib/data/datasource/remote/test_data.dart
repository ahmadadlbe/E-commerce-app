import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class TestData {
  Crud crud = Crud();
  TestData(this.crud);
  getdata() async {
    var respon = await crud.postrequest(AppLink.testlink, {});
    return respon.fold((l) => l, (r) => r);
  }
}
