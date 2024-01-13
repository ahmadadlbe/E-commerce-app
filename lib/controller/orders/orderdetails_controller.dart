import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/data/datasource/remote/order/details_data.dart';
import 'package:store_app/data/model/orderdetailes_model.dart';
import 'package:store_app/data/model/orders_model.dart';

import '../../core/functions/handllingdatacontrooler.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  Completer<GoogleMapController> completergooglemap =
      Completer<GoogleMapController>();
  List<Marker> marks = [];
  CameraPosition? kGooglePlex;
  StatusRequest statusRequest = StatusRequest.none;
  double? lat;
  double? lon;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());
  List<OrdersDetailsModel> data = [];

  getlatlng() async {
    if (ordersModel.addressId != null) {
      statusRequest = StatusRequest.loading;
      update();
      kGooglePlex = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 11.4746,
      );
      addmarker(LatLng(double.parse(ordersModel.addressLat!),
          double.parse(ordersModel.addressLong!)));
      statusRequest = StatusRequest.none;
      update();
    }
  }

  addmarker(LatLng latlng) {
    marks.clear();
    marks.add(Marker(markerId: const MarkerId("1"), position: latlng));
    lat = latlng.latitude;
    lon = latlng.longitude;
    update();
  }

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await orderDetailsData.getdata(orderid: ordersModel.ordersId!);
    statusRequest = handlingData(respon);
    if (statusRequest == StatusRequest.success) {
      if (respon['status'] == "success") {
        List respondata = respon['data'];
        data.addAll(respondata.map((e) => OrdersDetailsModel.fromJson(e)));
      } else if (respon['status'] == "failure") {}
    }
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersModel'];
    getlatlng();
    getdata();

    super.onInit();
  }
}
