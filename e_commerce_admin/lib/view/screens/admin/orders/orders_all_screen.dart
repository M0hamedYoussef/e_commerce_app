import 'package:e_commerce_admin/controller/admin/orders_con.dart';
import 'package:e_commerce_admin/view/widgets/orders/orders_items_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAllPage extends StatelessWidget {
  const OrdersAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersCon ordersCon = Get.put(OrdersCon());
    ordersCon.getAllOrders();
    return const SafeArea(
      child: OrdersList(),
    );
  }
}
