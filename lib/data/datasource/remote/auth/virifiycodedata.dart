import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class VerifiyCodeData {
  Crud crud = Crud();

  VerifiyCodeData(this.crud);
  postsVerifiycodedata({
    required String useremail,
    required String verifiycode,
  }) async {
    var respon = await crud.postrequest(AppLink.verifiycodelink, {
      "useremail": useremail,
      "verifiycode": verifiycode,
    });
    return respon.fold((l) => l, (r) => r);
  }

  resendVerifiycode({
    required String useremail,
  }) async {
    var respon = await crud
        .postrequest(AppLink.resendverifiycodelink, {"useremail": useremail});
    return respon.fold((l) => l, (r) => r);
  }
}
