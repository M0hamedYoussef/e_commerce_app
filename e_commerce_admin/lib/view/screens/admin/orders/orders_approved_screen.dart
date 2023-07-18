import 'package:e_commerce_admin/controller/admin/orders_con.dart';
import 'package:e_commerce_admin/view/widgets/orders/orders_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersApprovedPage extends StatelessWidget {
  const OrdersApprovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersCon ordersCon = Get.put(OrdersCon());
    ordersCon.getApprovedOrders();
    return const SafeArea(
      child: OrdersList(),
    );
  }
}
