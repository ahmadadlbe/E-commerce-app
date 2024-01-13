import 'package:get/get.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/functions/handllingdatacontrooler.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/data/datasource/remote/address_data.dart';
import 'package:store_app/data/model/address_model.dart';

class ViewAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.loading;

  MyService myService = Get.find();
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];

  initstate() {
    statusRequest = StatusRequest.none;
    update();
  }

  getaddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await addressData.getAddress(
      userid: myService.sharPreferences.getString("userid")!,
    );
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        List respondata = respon['data'];
        data.addAll(respondata.map((e) => AddressModel.fromJson(e)));
      } else {
        Get.defaultDialog(title: "79".tr);
      }
    }
    update();
  }

  Future refreshindicators() async {
    await getaddress();
  }

  deletdata(String addid) {
    addressData.deleteAddress(addressid: addid);

    data.removeWhere((element) => element.addressId == addid);

    update();
  }

  @override
  void onInit() {
    initstate();
    getaddress();
    super.onInit();
  }
}
