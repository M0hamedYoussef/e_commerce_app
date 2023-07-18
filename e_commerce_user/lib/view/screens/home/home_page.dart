import 'package:e_commerce/controller/home/home_con.dart';
import 'package:e_commerce/core/functions/exit_alert.dart';
import 'package:e_commerce/view/widgets/home/home_listview.dart';
import 'package:e_commerce/view/widgets/global/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeCon());

    return SafeArea(
      child: WillPopScope(
        onWillPop: exitAlert,
        child: GetBuilder<HomeCon>(
          builder: (controller) {
            if (controller.loading == true) {
              return const Loading();
            } else {
              return const HomeListView();
            }
          },
        ),
      ),
    );
  }
}
