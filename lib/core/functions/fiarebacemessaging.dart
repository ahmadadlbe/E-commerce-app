import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/orders/archive_controller.dart';
import 'package:store_app/controller/orders/pending_controller.dart';
import 'package:store_app/core/constant/routesname.dart';

permissionsfmessage() async {
  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fbmessageconfig() async {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshpageorder(message.data);
  });
}

refreshpageorder(data) {
  if (Get.currentRoute == "/pending" && data['pagename'] == "refreshorder") {
    PendingController controller = Get.find();
    controller.refreshpage();
  }
}

refreshorderArchive(data) {
  if (Get.currentRoute == AppRoutes.archiverouts &&
      data['pagename'] == "refreshorderarchive") {
    OrderArchiveController controller = Get.find();
    controller.refreshpage();
  }
}
