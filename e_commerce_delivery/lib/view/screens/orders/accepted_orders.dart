import 'package:e_commerce_delivery/core/functions/exit_alert.dart';
import 'package:e_commerce_delivery/controller/orders_con.dart';
import 'package:e_commerce_delivery/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce_delivery/view/widgets/orders/orders_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptedOrdersPage extends StatelessWidget {
  const AcceptedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersCon ordersCon = Get.put(OrdersCon());
    ordersCon.getAccepted();

    return SafeArea(
      child: WillPopScope(
        onWillPop: exitAlert,
        child: Column(
          children: [
            customAppBar(title: 'accepted_page'),
            const OrdersList(),
          ],
        ),
      ),
    );
  }
}
