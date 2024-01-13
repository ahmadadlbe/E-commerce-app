import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/routesname.dart';

class AddAddressController extends GetxController {
  Completer<GoogleMapController> completergooglemap =
      Completer<GoogleMapController>();
  List<Marker> marks = [];
  CameraPosition? kGooglePlex;
  StatusRequest statusRequest = StatusRequest.none;
  double? lat;
  double? lon;

  getlatlng() async {
    statusRequest = StatusRequest.loading;
    update();
    try {
      Position position = await Geolocator.getCurrentPosition();
      kGooglePlex = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 16.91234,
      );
      addmarker(LatLng(position.latitude, position.longitude));
    } on LocationServiceDisabledException catch (e) {
      Get.back();
      Get.defaultDialog(title: "53".tr, middleText: "$e");
    }
    statusRequest = StatusRequest.none;
    update();
  }

  Future refreshindicators() async {
    await getlatlng();
  }

  addmarker(LatLng latlng) {
    marks.clear();
    marks.add(Marker(markerId: const MarkerId("1"), position: latlng));
    lat = latlng.latitude;
    lon = latlng.longitude;
    update();
  }

  gotoaddtwo() {
    if (lat != null) {
      Get.toNamed(AppRoutes.addressAddTworouts, arguments: {
        "lat": lat.toString(),
        "lon": lon.toString(),
      });
    } else {
      Get.defaultDialog(title: "78".tr);
    }
  }

  @override
  void onInit() {
    getlatlng();
    super.onInit();
  }
}
