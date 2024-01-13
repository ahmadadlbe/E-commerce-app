import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class CheckEmailData {
  Crud crud = Crud();

  CheckEmailData(this.crud);
  postCheckemaildata({
    required String useremail,
  }) async {
    var respon = await crud
        .postrequest(AppLink.checkemaillink, {"useremail": useremail});
    return respon.fold((l) => l, (r) => r);
  }
}
