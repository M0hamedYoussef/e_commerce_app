import 'package:e_commerce/controller/orders/orders_con.dart';
import 'package:e_commerce/view/widgets/auth/global/app_bar.dart';
import 'package:e_commerce/view/widgets/orders/orders_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveScreen extends StatelessWidget {
  const OrdersArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersCon ordersCon = Get.put(OrdersCon());
    ordersCon.getArchiveData();

    return Scaffold(
      appBar: customAppBar(title: 'archive'),
      body: const OrdersItemsListView(),
    );
  }
}
