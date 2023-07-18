import 'package:e_commerce/controller/global/search_bar_con.dart';
import 'package:e_commerce/core/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationButton extends GetView<SearchBarCon> {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.greyDesign,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () {
            controller.goToNotifications();
          },
          splashRadius: 0.1,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.notifications_active_outlined,
            color: AppColors.greyLight,
          ),
        ),
      ),
    );
  }
}
