import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/favorite_data.dart';
import 'package:store_app/data/model/favorite_model.dart';

class FavoriteScreenController extends GetxController {
  Map isfavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyService myService = Get.find();
  List<FavoriteModel> datafavorite = [];
  FavoriteModel favoriteModel = FavoriteModel();

  @override
  void onInit() {
    viewfavorite();
    super.onInit();
  }

  Future refreshindicators() async {
    await viewfavorite();
  }

  viewfavorite() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await favoriteData
        .favoriteView(myService.sharPreferences.getString("userid")!);

    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        List respns = respon['data'];
        datafavorite.addAll(respns.map((e) => FavoriteModel.fromJson(e)));
      } else if (respon['status'] == "failure") {
        Get.defaultDialog(title: "53".tr, middleText: "no items in favorite");
      }
    }
    update();
  }

  deletfromfavorite(favoriteid) {
    favoriteData.favoritedeletefrom(favoriteid);
    datafavorite.removeWhere((element) => element.favoriteId == favoriteid);
    update();
  }
}
