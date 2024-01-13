import 'package:store_app/core/class/curd.dart';
import 'package:store_app/core/constant/links.dart';

class SignUpData {
  Crud crud = Crud();

  SignUpData(this.crud);
  postsignupdata({
    required String username,
    required String useremail,
    required String userpassword,
    required String userphon,
  }) async {
    var respon = await crud.postrequest(AppLink.signuplink, {
      "username": username,
      "useremail": useremail,
      "userpassword": userpassword,
      "phon": userphon,
    });
    return respon.fold((l) => l, (r) => r);
  }
}
