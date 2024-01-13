import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/orders/pending_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/view/widget/orders/cardpendingorders.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending'),
      ),
      body: Container(
        child: GetBuilder<PendingController>(
          builder: (controller) => HandlingVeiwData(
              statusRequest: controller.statusRequest,
              widget: RefreshIndicator(
                onRefresh: () => controller.refreshindicators(),
                child: ListView.builder(
                  itemBuilder: (context, index) => CustomPendingCardOrders(
                      ordersModel: controller.data[index]),
                  itemCount: controller.data.length,
                ),
              )),
        ),
      ),
    );
  }
}
