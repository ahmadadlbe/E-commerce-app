import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/controller/address/addaddress_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController con = Get.put(AddAddressController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Address'),
          actions: [
            IconButton(
                onPressed: () {
                  con.refreshindicators();
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: GetBuilder<AddAddressController>(
            builder: (pagecontroller) => HandlingVeiwData(
                statusRequest: pagecontroller.statusRequest,
                widget: RefreshIndicator(
                    onRefresh: () => pagecontroller.refreshindicators(),
                    child: pagecontroller.kGooglePlex == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    GoogleMap(
                                      onTap: (argument) {
                                        pagecontroller.addmarker(argument);
                                      },
                                      markers: pagecontroller.marks.toSet(),
                                      mapType: MapType.normal,
                                      initialCameraPosition:
                                          pagecontroller.kGooglePlex!,
                                      onMapCreated:
                                          (GoogleMapController controllermap) {
                                        pagecontroller.completergooglemap
                                            .complete(controllermap);
                                      },
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      child: MaterialButton(
                                        onPressed: () {
                                          pagecontroller.gotoaddtwo();
                                        },
                                        color: AppColors.primaryappcolor,
                                        child: const Text("Complete"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )))));
  }
}
