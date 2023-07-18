import 'package:e_commerce/controller/orders/indelivery/delivery_orders_con.dart';
import 'package:e_commerce/view/widgets/orders_delivery/orders_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersInDeliveryScreen extends StatelessWidget {
  const OrdersInDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryOrdersCon());

    return const Scaffold(
      body: DeliveryOrdersListView(),
    );
  }
}
