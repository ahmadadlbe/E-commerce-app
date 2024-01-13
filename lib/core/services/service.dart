import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/firebase_options.dart';

class MyService extends GetxService {
  late SharedPreferences sharPreferences;

  Future<MyService> initstate() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    sharPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialservice() async {
  await Get.putAsync(() => MyService().initstate());
}
