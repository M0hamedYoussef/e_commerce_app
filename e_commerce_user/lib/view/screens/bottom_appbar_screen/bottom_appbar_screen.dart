import 'package:e_commerce/controller/global/bottom_appbar_screen_con.dart';
import 'package:e_commerce/core/functions/exit_alert.dart';
import 'package:e_commerce/view/widgets/bottom_appbar_screen/bottom_app_bar.dart';
import 'package:e_commerce/view/widgets/bottom_appbar_screen/floating_action_button.dart';
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
          floatingActionButton: BottomActionButton(
            onPressed: () {
              controller.onFloatingPressed();
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
