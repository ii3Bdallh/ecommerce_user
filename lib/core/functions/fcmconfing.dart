// ignore_for_file: unused_local_variable

import 'package:ecommere_user/controller/orders/pinding_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmConFing() {
  FirebaseMessaging.onMessage.listen((event) {
    // يتم استاعدئهم في LocaleController
    FlutterRingtonePlayer ringtonePlayer = FlutterRingtonePlayer();
    ringtonePlayer.playNotification();
    refrechPage(event.data);
    Get.snackbar(event.notification!.title!, event.notification!.body!);
  });
}

refrechPage(data) {
  if (Get.currentRoute == "/orderabinding" &&
      data["pagename"] == "refrechorder") {
    BindingController controller = Get.find();
    controller.refreshorder();
  }
}

requestPermissoinNotifivation() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
//
