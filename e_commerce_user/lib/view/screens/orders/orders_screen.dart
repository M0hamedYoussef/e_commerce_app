import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/view/widgets/orders/orders_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersCon ordersCon = Get.put(OrdersCon());
    ordersCon.getData();

    return const Scaffold(
      body: OrdersItemsListView(),
    );
  }
}
