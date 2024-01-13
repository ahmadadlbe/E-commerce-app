import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/data/model/notification_model.dart';

class CustomNotificationCard extends StatelessWidget {
  final NotificationModel notificationModel;
  const CustomNotificationCard({required this.notificationModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${notificationModel.notificationTitle}"),
                  Text(
                    Jiffy(notificationModel.notificationDateTime, "yyyy-MM-dd")
                        .yMMMEd,
                    style: TextStyle(color: AppColors.primaryappcolor),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("${notificationModel.notificationBody}"),
          ],
        ),
      ),
    );
  }
}
