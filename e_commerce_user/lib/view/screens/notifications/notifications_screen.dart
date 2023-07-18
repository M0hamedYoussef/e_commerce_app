import 'package:e_commerce/controller/global/notifications_con.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/notifications/notifications_handling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsCon());
    return Scaffold(
      appBar: customAppBar(title: 'notifications_title'),
      body: const NotificationsListHandling(),
    );
  }
}
