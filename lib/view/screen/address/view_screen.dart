import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/address/viewaddress_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';

import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/view/widget/address/customcardaddress.dart';

class ViewAddressScreen extends StatelessWidget {
  const ViewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.toNamed(AppRoutes.addressAddrouts);
        }),
        appBar: AppBar(
          title: const Text('Address'),
        ),
        body: GetBuilder<ViewAddressController>(
            builder: (controller) => HandlingVeiwData(
                statusRequest: controller.statusRequest,
                widget: RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (context, index) => CustomCardAddress(
                        addressModel: controller.data[index],
                        onPressedicon: () {
                          controller
                              .deletdata(controller.data[index].addressId!);
                        },
                      ),
                      itemCount: controller.data.length,
                    ),
                    onRefresh: () => controller.refreshindicators()))));
  }
}
