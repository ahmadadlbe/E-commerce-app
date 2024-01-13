import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/offer_data.dart';
import 'package:store_app/data/model/items_model.dart';

class OfferController extends SearchMixController {
  OfferData offerData = OfferData(Get.find());

  List<ItemsModel> data = [];
  String dilevrytime = "";
  MyService myService = Get.find();

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await offerData.getdata();
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        List respnlist = respon['data'];
        data.addAll(respnlist.map((e) => ItemsModel.fromJson(e)));
      } else {
        Get.defaultDialog(title: "worning", middleText: "no items discount");
      }
    }
    statusRequest = StatusRequest.none;
    update();
  }

  goToitemsdetils(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.iditelsroutes, arguments: {"itemsmodel": itemsModel});
  }

  @override
  void onInit() {
    dilevrytime = myService.sharPreferences.getString("dilevrytime")!;
    getdata();
    super.onInit();
  }

  Future refreshindicators() async {
    dilevrytime = myService.sharPreferences.getString("dilevrytime")!;
    await getdata();
  }
}
