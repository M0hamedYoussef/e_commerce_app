import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/controller/global/notifications_con.dart';
import 'package:e_commerce/core/services/my_services.dart';
import 'package:e_commerce/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

notiicationsInit() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  
  FirebaseMessaging.onMessage.listen(
    (message) async {
      await HapticFeedback.heavyImpact();
      MyServices myServices = Get.find();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      if (Get.currentRoute == AppRoutes.notifications) {
        NotificationsCon notificationsCon = Get.find();
        notificationsCon.getData();
      } else {
        await myServices.getNotifications(
          userId: myServices.sharedPreferences.getString('user_id')!,
        );
        if (Get.currentRoute == AppRoutes.home) {
          OrdersCon ordersCon = Get.put(OrdersCon());
          ordersCon.getData();
        }
      }
    },
  );
}
