import 'package:e_commerce_delivery/controller/global/bottom_appbar_screen_con.dart';
import 'package:e_commerce_delivery/core/functions/exit_alert.dart';
import 'package:e_commerce_delivery/view/widgets/bottom_appbar_screen/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarScreen extends StatelessWidget {
  const BottomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomAppBarScreenCon());

    return GetBuilder<BottomAppBarScreenCon>(
      builder: (controller) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: exitAlert,
            child: controller.pages[controller.currentPageIndex]['route'],
          ),
          bottomNavigationBar: const CustomBottomBar(),
        );
      },
    );
  }
}
