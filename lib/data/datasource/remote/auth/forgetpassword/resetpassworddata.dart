import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class ResetPasswordData {
  Crud crud = Crud();

  ResetPasswordData(this.crud);
  postResetPasswordData({
    required String useremail,
    required String userpassword,
  }) async {
    var respon = await crud.postrequest(AppLink.resetpasswordlink, {
      "useremail": useremail,
      "userpassword": userpassword,
    });
    return respon.fold((l) => l, (r) => r);
  }
}
