import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/notification_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/view/widget/notification/notificationcard.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<NotificationController>(
            builder: (controller) => HandlingVeiwData(
                statusRequest: controller.statusRequest,
                widget: RefreshIndicator(
                  onRefresh: () => controller.refreshindicators(),
                  child: Container(
                    child: controller.data.isEmpty
                        ? const Text(
                            "No Notification",
                            style: TextStyle(fontSize: 25),
                          )
                        : ListView.builder(
                            itemCount: controller.data.length,
                            itemBuilder: (context, index) =>
                                CustomNotificationCard(
                                    notificationModel: controller.data[index]),
                          ),
                  ),
                )),
          )),
    );
  }
}
