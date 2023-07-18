import 'package:e_commerce_admin/controller/global/bottom_appbar_screen_con.dart';
import 'package:e_commerce_admin/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_admin/view/widgets/bottom_appbar_screen/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarScreen extends StatelessWidget {
  const BottomAppBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BottomAppBarScreenCon());

    return GetBuilder<BottomAppBarScreenCon>(
      builder: (controller) {
        Map data = controller.pages[controller.currentPageIndex];

        return Scaffold(
          appBar: customAppBar(title: data['bartitle']),
          body: data['route'],
          bottomNavigationBar: const CustomBottomBar(),
        );
      },
    );
  }
}
