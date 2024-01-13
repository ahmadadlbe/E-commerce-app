import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class LogInData {
  Crud crud = Crud();

  LogInData(this.crud);
  postlogindata({
    required String useremail,
    required String userpassword,
  }) async {
    var respon = await crud.postrequest(AppLink.loginlink, {
      "useremail": useremail,
      "userpassword": userpassword,
    });
    return respon.fold((l) => l, (r) => r);
  }
}
