import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/orders/archive_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/view/widget/orders/cardarchiveorder.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderArchiveController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Archive'),
      ),
      body: Container(
        child: GetBuilder<OrderArchiveController>(
          builder: (controller) => HandlingVeiwData(
              statusRequest: controller.statusRequest,
              widget: RefreshIndicator(
                child: ListView.builder(
                  itemBuilder: (context, index) => CustomArchiveCardOrders(
                      ordersModel: controller.data[index]),
                  itemCount: controller.data.length,
                ),
                onRefresh: () => controller.refreshindicators(),
              )),
        ),
      ),
    );
  }
}
