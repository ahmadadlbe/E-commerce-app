import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class VerifiyCodeForgetpasswordData {
  Crud crud = Crud();

  VerifiyCodeForgetpasswordData(this.crud);
  postVerifiyCodeData({
    required String useremail,
    required String verifiycode,
  }) async {
    var respon = await crud.postrequest(AppLink.verifiyCodeForgetPasswordlink, {
      "useremail": useremail,
      "verifiycode": verifiycode,
    });
    return respon.fold((l) => l, (r) => r);
  }
}
