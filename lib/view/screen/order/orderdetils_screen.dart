import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/controller/orders/orderdetails_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders Details'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<OrderDetailsController>(
              builder: (controller) => HandlingVeiwData(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.red))),
                                        children: [
                                          Text(
                                            "Items",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    AppColors.primaryappcolor,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "QYT",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    AppColors.primaryappcolor,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "Price",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color:
                                                    AppColors.primaryappcolor,
                                                fontSize: 22),
                                          ),
                                        ]),
                                    ...List.generate(
                                        controller.data.length,
                                        (index) => TableRow(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AppColors
                                                            .primaryappcolor)),
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "${controller.data[index].itemsName}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .grayappcolor,
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 100,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${controller.data[index].countitem}",
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .grayappcolor,
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 100,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "${controller.data[index].itemspriceDiscuont}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .grayappcolor,
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                ]))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Price : ${controller.ordersModel.ordersTotalprice}\$",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColors.primaryappcolor,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                        ),
                        controller.kGooglePlex != null
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: Card(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Shipingaddres",
                                      style: TextStyle(
                                          color: AppColors.primaryappcolor,
                                          fontSize: 22),
                                    ),
                                    ListTile(
                                      title: Text(
                                        "${controller.ordersModel.addressName}  ${controller.ordersModel.addressCity}",
                                        style: TextStyle(
                                            color: AppColors.grayappcolor,
                                            fontSize: 22),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 250,
                                      child: GoogleMap(
                                        markers: controller.marks.toSet(),
                                        mapType: MapType.normal,
                                        initialCameraPosition:
                                            controller.kGooglePlex!,
                                        onMapCreated: (GoogleMapController
                                            controllermap) {
                                          controller.completergooglemap
                                              .complete(controllermap);
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            : const Text("")
                      ],
                    ),
                  ))),
    );
  }
}
